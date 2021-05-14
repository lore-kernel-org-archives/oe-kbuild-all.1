Content-Type: multipart/mixed; boundary="===============7302945002792991285=="
MIME-Version: 1.0
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 2296/2770] kernel/bpf/helpers.c:713:43: warning: Uninitialized variable: bufs [uninitvar]
Date: Fri, 14 May 2021 07:17:59 -0700
Message-ID: <CAADnVQ+tYSnbgDP-+6vDG+kmJY3ngp2thoWpnUpT1X17VgqaaA@mail.gmail.com>
In-Reply-To: <CABRcYmLgV-5eDcuZL_sm95FJsVnjFgQ6b7bsA0o_u9bX5+FRnQ@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7302945002792991285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 14, 2021 at 7:10 AM Florent Revest <revest@chromium.org> wrot=
e:
>
> On Fri, May 14, 2021 at 8:37 AM kernel test robot <lkp@intel.com> wrote:
> > cppcheck possible warnings: (new ones prefixed by >>, may not real prob=
lems)
> >
> > >> kernel/bpf/helpers.c:713:43: warning: Uninitialized variable: bufs [=
uninitvar]
> >     if (WARN_ON_ONCE(nest_level > ARRAY_SIZE(bufs->tmp_bufs))) {
> >                                              ^
>
> I don't think this is a real problem. bufs is not actually
> dereferenced, it is only used to give the type information to a
> sizeof. This is only evaluated at compilation time.
>
> If this matters, I guess we could silent this cppcheck warning with
> something like the following patch. Alexei, what do you think ?
>
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -697,8 +697,9 @@ static int bpf_trace_copy_string(char *buf, void
> *unsafe_ptr, char fmt_ptype,
>  #define MAX_PRINTF_BUF_LEN     512
>
>  /* Support executing three nested bprintf helper calls on a given CPU */
> +#define MAX_PRINTF_NEST_LEVEL 3
>  struct bpf_bprintf_buffers {
> -       char tmp_bufs[3][MAX_PRINTF_BUF_LEN];
> +       char tmp_bufs[MAX_PRINTF_NEST_LEVEL][MAX_PRINTF_BUF_LEN];
>  };
>  static DEFINE_PER_CPU(struct bpf_bprintf_buffers, bpf_bprintf_bufs);
>  static DEFINE_PER_CPU(int, bpf_bprintf_nest_level);
> @@ -710,7 +711,7 @@ static int try_get_fmt_tmp_buf(char **tmp_buf)
>
>         preempt_disable();
>         nest_level =3D this_cpu_inc_return(bpf_bprintf_nest_level);
> -       if (WARN_ON_ONCE(nest_level > ARRAY_SIZE(bufs->tmp_bufs))) {
> +       if (WARN_ON_ONCE(nest_level > MAX_PRINTF_NEST_LEVEL)) {

Yeah. Why not. I think it's cleaner overall.
--===============7302945002792991285==--

