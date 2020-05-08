Content-Type: multipart/mixed; boundary="===============6933882483586190588=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v5 02/11] qla2xxx: Suppress two recently introduced compiler warnings
Date: Fri, 08 May 2020 23:25:06 +0200
Message-ID: <CAK8P3a3PA25WUJp73Yea9xq_ca3uXA9Vz2U=UmHiDhg8FmGiNw@mail.gmail.com>
In-Reply-To: <86bcf088-a35d-0a0f-0ba4-5883b1f2d6cb@acm.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6933882483586190588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2020 at 1:16 AM Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 2020-05-07 15:00, Nick Desaulniers wrote:
> > On Thu, May 7, 2020 at 12:18 PM kbuild test robot <lkp@intel.com> wro=
te:
> >> All errors (new ones prefixed by >>):
> >>
> >>    In file included from drivers/scsi/qla2xxx/qla_dbg.c:77:
> >>>> include/trace/events/qla.h:13:32: error: unknown warning group '-Wsu=
ggest-attribute=3Dformat', ignored [-Werror,-Wunknown-warning-option]
> >>    #pragma GCC diagnostic ignored "-Wsuggest-attribute=3Dformat"
> >>                                   ^
> >
> > Hi Bart,
> > These compiler specific pragma's are not toolchain portable.  You'll
> > need to wrap them in:
> > #ifndef __clang__
> > preprocessor macros, or I think we have a pragma helper in tree that
> > helps with compiler specific pragmas.  IIRC it uses _Pragma to define
> > pragmas in macros.
> Hi Nick,
>
> Thanks for the feedback. I will have a look at _Pragma() and see what
> the best way is to suppress this warning.

The __diag_ignore() macro in linux/compiler.h should work for this.

       Arnd
--===============6933882483586190588==--

