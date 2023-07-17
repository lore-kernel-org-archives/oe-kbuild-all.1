Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3060AA943
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jul 2023 12:54:49 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5216095a698so1091811a12.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jul 2023 05:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689598487; x=1690203287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2uSSqoDKdw1xON6ZQFvPCT+NY31p6OTOAF8u4sw0ok=;
        b=FsD8gB7WXrBbyKCGlsEoL0IHjPNhKK9j88992VQ97VEq6frK1iIYTGhmyTGFg0cMGF
         XUjfxn1QVN0blhJCYFy+pqeJixDAPzLHw9nJFDz4YxhmnSMYhjJUFv44pci8chWNm8Kh
         3iDv/kd80hgMUoFCeMmImejD4xXXK8uRJHzU/J+DTmuECIL6a8eefIcQb2YpwJEpm7WB
         +SKJXxbu76giLRsYSqgFG367BT+aQJl5QJ0+kA0qworZOie5sTbW69QItOQGR+PSEcnF
         XRm0l5aq6qw0GToemTh0mlgjTW9skkdSlgfy9hDJNed3cZTYcdiluvJR3gB/JSb+zufT
         5SRA==
X-Gm-Message-State: ABy/qLZgh/cDcJWYGAoMA6q8ra6mIvIUNRsE5UC5ncY9gXofrEYaQnmd
	d+JuvvwSdxV6W03q00rNYNomA3xfhkPQkVJmkmk=
X-Google-Smtp-Source: APBJJlG/RFN+alXBMoZub7ZXDrvQKawf7/X52T+PEZuEfvnaSfe0Xzt9b0VQh9l5v/sXc1F2JO/i0QHiWOIqqbfG0Yg=
X-Received: by 2002:a17:906:74dc:b0:994:1808:176b with SMTP id
 z28-20020a17090674dc00b009941808176bmr8581743ejl.6.1689598486971; Mon, 17 Jul
 2023 05:54:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307150637.CGq9exEE-lkp@intel.com> <6f8d0187-0a90-1fa2-61e9-0a7b9a44106e@intel.com>
In-Reply-To: <6f8d0187-0a90-1fa2-61e9-0a7b9a44106e@intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 17 Jul 2023 14:54:31 +0200
Message-ID: <CAJZ5v0gP9oGSdsH9KcMamGbc=ca7rZtSVSOSvz=GuLuMiTvt1w@mail.gmail.com>
Subject: Re: [rafael-pm:bleeding-edge 22/40] drivers/acpi/internal.h:161:
 multiple definition of `acpi_early_processor_control_setup';
 drivers/acpi/tables.o:drivers/acpi/internal.h:161: first defined here
To: "Wilczynski, Michal" <michal.wilczynski@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-acpi@vger.kernel.org, devel@acpica.org, linux-pm@vger.kernel.org, 
	"Rafael J. Wysocki" <rjw@rjwysocki.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 12:48=E2=80=AFPM Wilczynski, Michal
<michal.wilczynski@intel.com> wrote:
>
> Hi,
>
> On 7/15/2023 12:47 AM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm=
.git bleeding-edge
> > head:   4f9dd7927c1cdbaffb20fcdbcc2bdc6caa0b4736
> > commit: ca805e0f04a5f9a773875ad6de914e54e41d43c7 [22/40] ACPI: processo=
r: Use _OSC to convey OSPM processor support information
> > config: arm64-defconfig (https://download.01.org/0day-ci/archive/202307=
15/202307150637.CGq9exEE-lkp@intel.com/config)
> > compiler: aarch64-linux-gcc (GCC) 12.3.0
> > reproduce: (https://download.01.org/0day-ci/archive/20230715/2023071506=
37.CGq9exEE-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202307150637.CGq9exEE-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    aarch64-linux-ld: drivers/acpi/osi.o: in function `acpi_early_proces=
sor_control_setup':
> >>> drivers/acpi/internal.h:161: multiple definition of `acpi_early_proce=
ssor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fir=
st defined here
> >    aarch64-linux-ld: drivers/acpi/osl.o: in function `acpi_early_proces=
sor_control_setup':
> >>> drivers/acpi/internal.h:161: multiple definition of `acpi_early_proce=
ssor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fir=
st defined here
> >    aarch64-linux-ld: drivers/acpi/utils.o: in function `acpi_early_proc=
essor_control_setup':
> >>> drivers/acpi/internal.h:161: multiple definition of `acpi_early_proce=
ssor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fir=
st defined here
> >    aarch64-linux-ld: drivers/acpi/nvs.o: in function `acpi_early_proces=
sor_control_setup':
> >    drivers/acpi/nvs.c:161: multiple definition of `acpi_early_processor=
_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: first d=
efined here
> >    aarch64-linux-ld: drivers/acpi/wakeup.o: in function `acpi_early_pro=
cessor_control_setup':
> >>> drivers/acpi/internal.h:161: multiple definition of `acpi_early_proce=
ssor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fir=
st defined here
> >    aarch64-linux-ld: drivers/acpi/device_sysfs.o: in function `acpi_ear=
ly_processor_control_setup':
> >>> drivers/acpi/internal.h:161: multiple definition of `acpi_early_proce=
ssor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fir=
st defined here
> >    aarch64-linux-ld: drivers/acpi/device_pm.o: in function `acpi_early_=
processor_control_setup':
> >>> drivers/acpi/internal.h:161: multiple definition of `acpi_early_proce=
ssor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fir=
st defined here
> >    aarch64-linux-ld: drivers/acpi/bus.o: in function `acpi_early_proces=
sor_control_setup':
> >>> drivers/acpi/internal.h:161: multiple definition of `acpi_early_proce=
ssor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fir=
st defined here
> >    aarch64-linux-ld: drivers/acpi/glue.o: in function `acpi_early_proce=
ssor_control_setup':
> >>> drivers/acpi/internal.h:161: multiple definition of `acpi_early_proce=
ssor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fir=
st defined here
> >    aarch64-linux-ld: drivers/acpi/scan.o: in function `acpi_early_proce=
ssor_control_setup':
> >>> drivers/acpi/internal.h:161: multiple definition of `acpi_early_proce=
ssor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fir=
st defined here
> >    aarch64-linux-ld: drivers/acpi/acpi_processor.o: in function `acpi_e=
arly_processor_control_setup':
> >>> drivers/acpi/internal.h:161: multiple definition of `acpi_early_proce=
ssor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fir=
st defined here
> >    aarch64-linux-ld: drivers/acpi/ec.o: in function `acpi_early_process=
or_control_setup':
> >>> drivers/acpi/internal.h:161: multiple definition of `acpi_early_proce=
ssor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fir=
st defined here
> >    aarch64-linux-ld: drivers/acpi/pci_root.o: in function `acpi_early_p=
rocessor_control_setup':
> >>> drivers/acpi/internal.h:161: multiple definition of `acpi_early_proce=
ssor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fir=
st defined here
> >    aarch64-linux-ld: drivers/acpi/pci_link.o: in function `acpi_early_p=
rocessor_control_setup':
> >>> drivers/acpi/internal.h:161: multiple definition of `acpi_early_proce=
ssor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fir=
st defined here
> >    aarch64-linux-ld: drivers/acpi/acpi_lpss.o: in function `acpi_early_=
processor_control_setup':
> >    drivers/acpi/acpi_lpss.c:161: multiple definition of `acpi_early_pro=
cessor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: f=
irst defined here
> >    aarch64-linux-ld: drivers/acpi/acpi_apd.o: in function `acpi_early_p=
rocessor_control_setup':
> >>> drivers/acpi/internal.h:161: multiple definition of `acpi_early_proce=
ssor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fir=
st defined here
> >    aarch64-linux-ld: drivers/acpi/acpi_platform.o: in function `acpi_ea=
rly_processor_control_setup':
> >>> drivers/acpi/internal.h:161: multiple definition of `acpi_early_proce=
ssor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fir=
st defined here
> >    aarch64-linux-ld: drivers/acpi/acpi_pnp.o: in function `acpi_early_p=
rocessor_control_setup':
> >>> drivers/acpi/internal.h:161: multiple definition of `acpi_early_proce=
ssor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fir=
st defined here
> >    aarch64-linux-ld: drivers/acpi/acpi_amba.o: in function `acpi_early_=
processor_control_setup':
> >>> drivers/acpi/internal.h:161: multiple definition of `acpi_early_proce=
ssor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fir=
st defined here
> >    aarch64-linux-ld: drivers/acpi/power.o: in function `acpi_early_proc=
essor_control_setup':
> >>> drivers/acpi/internal.h:161: multiple definition of `acpi_early_proce=
ssor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fir=
st defined here
> >    aarch64-linux-ld: drivers/acpi/event.o: in function `acpi_early_proc=
essor_control_setup':
> >>> drivers/acpi/internal.h:161: multiple definition of `acpi_early_proce=
ssor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fir=
st defined here
> >    aarch64-linux-ld: drivers/acpi/sysfs.o: in function `acpi_early_proc=
essor_control_setup':
> >>> drivers/acpi/internal.h:161: multiple definition of `acpi_early_proce=
ssor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fir=
st defined here
> >    aarch64-linux-ld: drivers/acpi/property.o: in function `acpi_early_p=
rocessor_control_setup':
> >    drivers/acpi/internal.h:161: multiple definition of `acpi_early_proc=
essor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fi=
rst defined here
> >    aarch64-linux-ld: drivers/acpi/debugfs.o: in function `acpi_early_pr=
ocessor_control_setup':
> >    drivers/acpi/debugfs.c:161: multiple definition of `acpi_early_proce=
ssor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fir=
st defined here
> >    aarch64-linux-ld: drivers/acpi/processor_driver.o: in function `acpi=
_early_processor_control_setup':
> >    drivers/acpi/internal.h:161: multiple definition of `acpi_early_proc=
essor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fi=
rst defined here
> >    aarch64-linux-ld: drivers/acpi/container.o: in function `acpi_early_=
processor_control_setup':
> >    drivers/acpi/internal.h:161: multiple definition of `acpi_early_proc=
essor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fi=
rst defined here
> >    aarch64-linux-ld: drivers/acpi/acpi_memhotplug.o: in function `acpi_=
early_processor_control_setup':
> >    drivers/acpi/internal.h:161: multiple definition of `acpi_early_proc=
essor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h:161: fi=
rst defined here
> >    aarch64-linux-ld: drivers/acpi/dptf/int340x_thermal.o: in function `=
acpi_early_processor_control_setup':
> >    drivers/acpi/dptf/../internal.h:161: multiple definition of `acpi_ea=
rly_processor_control_setup'; drivers/acpi/tables.o:drivers/acpi/internal.h=
:161: first defined here
> >
> >
> > vim +161 drivers/acpi/internal.h
> >
> >    157
> >    158        void acpi_proc_quirk_mwait_check(void);
> >    159        bool processor_physically_present(acpi_handle handle);
> >    160        #else
> >  > 161        void acpi_early_processor_control_setup(void) {}
>
> I think this should be
> static inline void acpi_early_processor_control_setup(void) {}

I think so.

> Hopefully you could amend this commit ?

Done.

> Not sure why 0-day haven't caught it sooner.

Probably due to lighter coverage of individual patches.

Thanks!
