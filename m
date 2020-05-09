Content-Type: multipart/mixed; boundary="===============7490532203245701529=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v5 02/11] qla2xxx: Suppress two recently introduced compiler warnings
Date: Sat, 09 May 2020 09:59:59 +0200
Message-ID: <CAK8P3a1+jtP9NRj-UCaDHjGSJiqDA4Y=0YTMfvr7zWS+OKRTUw@mail.gmail.com>
In-Reply-To: <040756ba-81ea-64e4-6a11-85608b871b88@acm.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7490532203245701529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 9, 2020 at 12:29 AM Bart Van Assche <bvanassche@acm.org> wrot=
e:
>
> >> Thanks for the feedback. I will have a look at _Pragma() and see what
> >> the best way is to suppress this warning.
> >
> > The __diag_ignore() macro in linux/compiler.h should work for this.
>
> Thanks Arnd, that's good to know. Is using __diag_ignore() mandatory in
> this case? The following construct seems to work fine with both gcc and
> clang:
>
>  #define QLA_MSG_MAX 256
>
> +#pragma GCC diagnostic push
> +#ifndef __clang__
> +#pragma GCC diagnostic ignored "-Wsuggest-attribute=3Dformat"
> +#endif
> +
>  DECLARE_EVENT_CLASS(qla_log_event,
>         TP_PROTO(const char *buf,
>                 struct va_format *vaf),
> @@ -27,6 +32,8 @@ DECLARE_EVENT_CLASS(qla_log_event,
>         TP_printk("%s %s", __get_str(buf), __get_str(msg))
>  );
>
> +#pragma GCC diagnostic pop
> +
>  DEFINE_EVENT(qla_log_event, ql_dbg_log,
>         TP_PROTO(const char *buf, struct va_format *vaf),
>         TP_ARGS(buf, vaf)

__diag_push(), __diag_ignore(), and __diag_pop() are just
shortcuts for open-coded #pragma plus #ifdef, they do
exactly the same thing here. I think it would be best to be
consistent and use the macros, but it works either way.

I actually have patches to introduce yet another syntax as part
of a larger rework, but that is still WiP.

       Arnd
--===============7490532203245701529==--

