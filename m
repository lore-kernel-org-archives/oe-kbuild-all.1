Content-Type: multipart/mixed; boundary="===============3755516157453251908=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [balbi-usb:testing/fixes 2/8] WARNING: simple_strtoul is obsolete, use kstrtoul instead
Date: Mon, 18 May 2020 22:59:11 +0800
Message-ID: <20200518145911.GA14746@intel.com>
In-Reply-To: <CAAeHK+wLp6h9Ew5ZHgk7u3qQ7gN32ZPqdWUcYcFNYfzFw5EvVQ@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3755516157453251908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2020 at 04:16:25PM +0200, Andrey Konovalov wrote:
> On Mon, May 18, 2020 at 5:34 AM kbuild test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git t=
esting/fixes
> > head:   172b14b48ca10b280482b164506892ea09edb946
> > commit: 97df5e5758f7d1dd0ca97e3210696818fc45bdb3 [2/8] usb: raw-gadget:=
 fix gadget endpoint selection
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > scripts/checkpatch.pl 0001-usb-raw-gadget-fix-gadget-endpoint-selection=
.patch
> > # many are suggestions rather than must-fix
> >
> > WARNING: simple_strtoul is obsolete, use kstrtoul instead
> > #123: drivers/usb/gadget/legacy/raw_gadget.c:261:
> > +               return simple_strtoul(&name[2], NULL, 10);
> =

> The use of simple_strtoul() is intended here and falls under [1]. I'm
> not sure if we need to explain this to kbuild test robot somehow.
thanks for the info, we will be careful for this WARNING in future. Sorry
for the wrong report.

> =

> [1] https://elixir.bootlin.com/linux/v5.7-rc5/source/include/linux/kernel=
.h#L459
> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org
--===============3755516157453251908==--

