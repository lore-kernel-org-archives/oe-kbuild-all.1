Content-Type: multipart/mixed; boundary="===============8804483311239861269=="
MIME-Version: 1.0
From: Andrey Konovalov <andreyknvl@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [balbi-usb:testing/fixes 2/8] WARNING: simple_strtoul is obsolete, use kstrtoul instead
Date: Mon, 18 May 2020 16:16:25 +0200
Message-ID: <CAAeHK+wLp6h9Ew5ZHgk7u3qQ7gN32ZPqdWUcYcFNYfzFw5EvVQ@mail.gmail.com>
In-Reply-To: <20200518033319.GC24805@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8804483311239861269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2020 at 5:34 AM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tes=
ting/fixes
> head:   172b14b48ca10b280482b164506892ea09edb946
> commit: 97df5e5758f7d1dd0ca97e3210696818fc45bdb3 [2/8] usb: raw-gadget: f=
ix gadget endpoint selection
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> scripts/checkpatch.pl 0001-usb-raw-gadget-fix-gadget-endpoint-selection.p=
atch
> # many are suggestions rather than must-fix
>
> WARNING: simple_strtoul is obsolete, use kstrtoul instead
> #123: drivers/usb/gadget/legacy/raw_gadget.c:261:
> +               return simple_strtoul(&name[2], NULL, 10);

The use of simple_strtoul() is intended here and falls under [1]. I'm
not sure if we need to explain this to kbuild test robot somehow.

[1] https://elixir.bootlin.com/linux/v5.7-rc5/source/include/linux/kernel.h=
#L459
--===============8804483311239861269==--

