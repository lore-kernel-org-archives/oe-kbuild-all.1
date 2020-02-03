Content-Type: multipart/mixed; boundary="===============9109235592043701806=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v5 6/6] powerpc/vdso: Switch VDSO to generic C implementation.
Date: Mon, 03 Feb 2020 12:59:14 +0100
Message-ID: <CAK8P3a2+Cq_-L662WaQeScTTX1W50wPAkqs1R=fqyrHrd74znw@mail.gmail.com>
In-Reply-To: <202002031426.QLrslGif%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9109235592043701806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2020 at 12:28 PM kbuild test robot <lkp@intel.com> wrote:
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> arch/powerpc/kernel/vdso32/vgettimeofday.c:26:1: error: unknown type n=
ame 'time_t'; did you mean 'ktime_t'?
>     time_t __c_kernel_time(time_t *time, const struct vdso_data *vd)
>     ^~~~~~
>     ktime_t


time_t is no longer available in linux-next, so this has to use
__kernel_old_time_t.

      Arnd
--===============9109235592043701806==--

