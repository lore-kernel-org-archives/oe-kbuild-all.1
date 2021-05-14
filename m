Content-Type: multipart/mixed; boundary="===============5795401531029212683=="
MIME-Version: 1.0
From: Florent Revest <revest@chromium.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 2296/2770] kernel/bpf/helpers.c:713:43: warning: Uninitialized variable: bufs [uninitvar]
Date: Fri, 14 May 2021 16:10:32 +0200
Message-ID: <CABRcYmLgV-5eDcuZL_sm95FJsVnjFgQ6b7bsA0o_u9bX5+FRnQ@mail.gmail.com>
In-Reply-To: <20210514063622.GU2687475@shao2-debian>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5795401531029212683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 14, 2021 at 8:37 AM kernel test robot <lkp@intel.com> wrote:
> cppcheck possible warnings: (new ones prefixed by >>, may not real proble=
ms)
>
> >> kernel/bpf/helpers.c:713:43: warning: Uninitialized variable: bufs [un=
initvar]
>     if (WARN_ON_ONCE(nest_level > ARRAY_SIZE(bufs->tmp_bufs))) {
>                                              ^

I don't think this is a real problem. bufs is not actually
dereferenced, it is only used to give the type information to a
sizeof. This is only evaluated at compilation time.

If this matters, I guess we could silent this cppcheck warning with
something like the following patch. Alexei, what do you think ?

--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -697,8 +697,9 @@ static int bpf_trace_copy_string(char *buf, void
*unsafe_ptr, char fmt_ptype,
 #define MAX_PRINTF_BUF_LEN     512

 /* Support executing three nested bprintf helper calls on a given CPU */
+#define MAX_PRINTF_NEST_LEVEL 3
 struct bpf_bprintf_buffers {
-       char tmp_bufs[3][MAX_PRINTF_BUF_LEN];
+       char tmp_bufs[MAX_PRINTF_NEST_LEVEL][MAX_PRINTF_BUF_LEN];
 };
 static DEFINE_PER_CPU(struct bpf_bprintf_buffers, bpf_bprintf_bufs);
 static DEFINE_PER_CPU(int, bpf_bprintf_nest_level);
@@ -710,7 +711,7 @@ static int try_get_fmt_tmp_buf(char **tmp_buf)

        preempt_disable();
        nest_level =3D this_cpu_inc_return(bpf_bprintf_nest_level);
-       if (WARN_ON_ONCE(nest_level > ARRAY_SIZE(bufs->tmp_bufs))) {
+       if (WARN_ON_ONCE(nest_level > MAX_PRINTF_NEST_LEVEL)) {
                this_cpu_dec(bpf_bprintf_nest_level);
                preempt_enable();
                return -EBUSY;
--===============5795401531029212683==--

