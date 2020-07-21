export const responseSuccess = (data: any) => ({
  error: false,
  message: "",
  ...data
});

export const responseFailure = (message: string) => ({
  error: true,
  message,
});
