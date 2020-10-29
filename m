Content-Type: multipart/mixed; boundary="===============2806815832348341676=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: ld.lld: error: undefined symbol: amba_driver_register
Date: Thu, 29 Oct 2020 20:30:52 +0100
Message-ID: <20201029193052.GA389163@kozik-lap>
In-Reply-To: <CAKwvOdk82WZnCh9G8CidN9tJ6qiMaHYdN-e+Ad5kRa6C87Vfxg@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2806815832348341676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2020 at 12:28:54PM -0700, Nick Desaulniers wrote:
> On Wed, Oct 28, 2020 at 9:57 PM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   23859ae44402f4d935b9ee548135dd1e65e2cbf4
> > commit: ea0c0ad6b6eb36726088991d97a55b99cae456d0 memory: Enable compile=
 testing for most of the drivers
> > date:   2 months ago
> > config: arm-randconfig-r024-20201028 (attached as .config)
> =

> ^ Note, this was a randconfig, so the preprocessor guards on CONFIGs
> might be wrong.

The report looks correct. It's possible to craft ARM config without
ARM_AMBA which would cause this issue. I have a fix ready.

Best regards,
Krzysztof
--===============2806815832348341676==--

