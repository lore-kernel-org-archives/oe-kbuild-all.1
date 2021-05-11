Content-Type: multipart/mixed; boundary="===============3367250421134252335=="
MIME-Version: 1.0
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v9 05/10] regulator: IRQ based event/error notification helpers
Date: Tue, 11 May 2021 06:24:32 +0300
Message-ID: <6121a55d7db8cc4376c068e289fb29b9d4479dbd.camel@fi.rohmeurope.com>
In-Reply-To: <CAHp75Vfw+5R-qN+iGC4hYSbL6phOoSZ7nuNsyroQPODxEmMaNA@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3367250421134252335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andy, All,

On Mon, 2021-05-10 at 23:20 +0300, Andy Shevchenko wrote:
> On Mon, May 10, 2021 at 10:46 PM kernel test robot <lkp@intel.com>
> wrote:

> > =

> >    include/linux/bitops.h:35:2: warning: this 'for' clause does not
> > guard... [-Wmisleading-indentation]
> >       35 |  for ((bit) =3D find_first_bit((addr), (size));  \
> >          |  ^~~
> >    drivers/regulator/irq_helpers.c:242:3: note: in expansion of
> > macro 'for_each_set_bit'
> >      242 |   for_each_set_bit(j, &stat->notifs, BITS_PER_TYPE(stat-
> > >notifs))
> >          |   ^~~~~~~~~~~~~~~~
> >    drivers/regulator/irq_helpers.c:244:4: note: ...this statement,
> > but the latter is misleadingly indented as if it were guarded by
> > the 'for'
> =

> Seems like missed {}
> =

> Matti, there is a serious question: how had you tested this...

I actually did. I did not just run rebase for the series and threw new
version but I actually did run this in real HW, with real break-out
board and with a fresh info print to see the event being sent.

> (besides obvious compilation error)
> Perhaps you have to fix your process somewhere to avoid missing
> important steps?

Yes. Can't deny this. And process fix should be simple. If code/patch
needs a change (even a print removal/print severity change/parameter
change)  - then it needs to be tested again prior formatting the
patches.

Sorry folks.

--Matti

--===============3367250421134252335==--

