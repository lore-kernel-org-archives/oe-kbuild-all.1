Content-Type: multipart/mixed; boundary="===============0977252526126879835=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1056 vchiq_get_user_ptr() error: uninitialized symbol 'ptr'.
Date: Tue, 05 Jan 2021 14:53:15 +0100
Message-ID: <CAK8P3a1EAWoqNxaJOSPsLdCF82QNAA-YWpYwA13cex_UC1iLyQ@mail.gmail.com>
In-Reply-To: <20210104105452.GM2809@kadam>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0977252526126879835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 4, 2021 at 11:54 AM Dan Carpenter <dan.carpenter@oracle.com> =
wrote:

>
> 5d240a54be7e592 Arnd Bergmann 2020-09-18  1044  static inline int vchiq_g=
et_user_ptr(void __user **buf, void __user *ubuf, int index)
> 5d240a54be7e592 Arnd Bergmann 2020-09-18  1045  {
> 5d240a54be7e592 Arnd Bergmann 2020-09-18  1046          int ret;
> 5d240a54be7e592 Arnd Bergmann 2020-09-18  1047
> 5d240a54be7e592 Arnd Bergmann 2020-09-18  1048          if (in_compat_sys=
call()) {
> 4184da4f316a549 Arnd Bergmann 2020-09-25  1049                  compat_up=
tr_t ptr32;
> 5d240a54be7e592 Arnd Bergmann 2020-09-18  1050                  compat_up=
tr_t __user *uptr =3D ubuf;
> 4184da4f316a549 Arnd Bergmann 2020-09-25  1051                  ret =3D g=
et_user(ptr32, uptr + index);
> 5d240a54be7e592 Arnd Bergmann 2020-09-18  1052                  *buf =3D =
compat_ptr(ptr32);
> 5d240a54be7e592 Arnd Bergmann 2020-09-18  1053          } else {
> 4184da4f316a549 Arnd Bergmann 2020-09-25  1054                  uintptr_t=
 ptr, __user *uptr =3D ubuf;
> 4184da4f316a549 Arnd Bergmann 2020-09-25  1055                  ret =3D g=
et_user(ptr, uptr + index);
> 4184da4f316a549 Arnd Bergmann 2020-09-25 @1056                  *buf =3D =
(void __user *)ptr;
>
> If get_user() fails then this is uninitialized.  This will trigger a
> runtime error if the UBSan uninitialized behavior tool is enabled.

Thanks for the report, I sent a fix now.

      Arnd
--===============0977252526126879835==--

