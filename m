Content-Type: multipart/mixed; boundary="===============5622134740804172724=="
MIME-Version: 1.0
From: Marco Elver <elver@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [tip:locking/kcsan 12/12] /bin/bash: line 1: 61526 Segmentation fault sparse ...
Date: Thu, 28 May 2020 17:30:44 +0200
Message-ID: <CANpmjNPOu2rduGN-jbpMi77vsfz2J5q-EPfkvHqr48K9DEcmSQ@mail.gmail.com>
In-Reply-To: <20200528152218.npq53zode7hh7qh4@ltop.local>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5622134740804172724==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 28 May 2020 at 17:22, Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> On Thu, May 28, 2020 at 09:59:00AM +0200, Marco Elver wrote:
> >
> > Ouch. The below should be all we need, assuming it's the best we can do
> > for sparse right now.
>
> Upstream sparse should be OK with it now.

Very good, thank you! For 5.8 we probably still want the ifdef
__CHECKER__, otherwise we might break too many existing workflows. But
hopefully we can remove it again at some point. At the latest when the
kernel deprecates GCC 4.8 support, because then we can just remove the
whole unoptimized __unqual_scalar_typeof() definition.

Thanks,
-- Marco
--===============5622134740804172724==--

