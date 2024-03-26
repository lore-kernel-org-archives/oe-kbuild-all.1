Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F49813175C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 07:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711439090; cv=none; b=rDbNlk7yG7tj30+7roPb4D8LvkGDX+CCENP6zvbXo7FxE2UDjTqJyzxcBA13bzuOZBDIBwPK7k8vFPu7G5xt7QytHKRB5hoKt1yao4CWwViwuWVB+NVyo6oKBr2PFW1nMSquA0q4g4vYro10modLI+9tMePYY3xRehcSebNxeYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711439090; c=relaxed/simple;
	bh=2/FVqdQ3pa/YYyWmdVuzFzqIXphfYwk7uHWB0e5pDEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZT6n/S61CTYGDUGE5DU1G3KkzkBcJmldF+DmpiycMgXPIS0wnA8ZQ8+xXbk9xtZfNa4jh/Kt2mr6Hc8k9tgFn3EP8w9YkSGhrgpJxyC+CxQXOAjQGq5U+h+cxRkK1QjIhrNyD8jzsg2rNAVDkbKDE3VoraKjn7ITMOZnLw43+Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TcCU5bpD; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TcCU5bpD"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dd10ebcd702so5301474276.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 00:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711439087; x=1712043887; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cz/F1g9etmc05WH8wz3xnEAyJnxi7GBwM0dm1FpI4b4=;
        b=TcCU5bpDZVXyWPiJOTlfF/S3cFfg2bun/kuG5UQWzjXvJguARTf4q0wc4a1G358jrs
         8NPfmsgS9evg9toBMiLNiOAFbNJXZAzWccEAQmvH9rfH/rW5V3XP3rFRMUsgoOYI7vQY
         o4upbOgwmWKIlz9gqIWavYLiZzIuWmMrt44ZOexK+Ocpzk08a+jJmWbML1socFdLiDNN
         uQorD8SiEz54kHPVu4RSiH8atnYcXy6Erya8f5PKpWvxnXIdM2Yf1FFsnlYbgLdKlw2f
         xOy4LZpFzwjxYYqrGv6eY9orQtT9Vd1KG9q9uKX81k/kvS6XHsJhW3PM6MGJzMiBXF+T
         D8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711439087; x=1712043887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cz/F1g9etmc05WH8wz3xnEAyJnxi7GBwM0dm1FpI4b4=;
        b=m/VNUlUT5ACjeoE3wiXGplDUzEDSO7Em/pdwaKyc1/Wg1WBn9NCgQFD7Mrsy+78vRS
         fmJQYYmwcCRClVFcJxI8vV5cLExGTUBBBGxJxvDVlc2YoiLx5D+be8uK0ztRySlCftt+
         dZK+zUAd5EmdLNQy45Snh4yjElhSn1UZGQAVxji/e/EVBmG6ePq9N18NhyJnLPkYlgHp
         NO5nlIxD0hTx0Oy3w7n1Ka4f+JvIwuUjE5048fJz9ttUFHoBPktXDPEPJqPIjdW5q24k
         RvmYunZVQCSmfbgBwDnmYNhXh6qWg7nzynAR4ZhUSsPIHcemxiesBdy21mIeg6gpzQhb
         rHMw==
X-Forwarded-Encrypted: i=1; AJvYcCWXwwBCDn2QMFlGdNVvqNMuZrT7EeZVgokJL2ePAmNhIJxJ4e6N7PP3/69H503zDAA2wGfEvFOA1EKiJORdAG5WpezrBueDWi8js1aNzg==
X-Gm-Message-State: AOJu0YzJGPv20Fg8SsypvdRpp8wjuVXe4d+EDyHNUGrOospEeGUK42GD
	t6mOdrRXpitMuYoTSCBxO+kujO8T72Tnm9JfuPYJOiHJ5ooBiT0dq3a0kCkWGBdxfsMtfs5PuIS
	QyUg9r/aHZTa0QMsL18guhGveyl3vtklN9QxO
X-Google-Smtp-Source: AGHT+IEdCDZ+UQgHigPDs5+s1IAuReppMwrREaCKwZkaU3zi2sLutvU3tCdyAQkTtrervBLZICRayrZH9CVkGL4B6Ig=
X-Received: by 2002:a5b:bcc:0:b0:dd1:2f58:6a2e with SMTP id
 c12-20020a5b0bcc000000b00dd12f586a2emr7574603ybr.9.1711439086730; Tue, 26 Mar
 2024 00:44:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403252127.967BczRr-lkp@intel.com>
In-Reply-To: <202403252127.967BczRr-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 26 Mar 2024 00:44:34 -0700
Message-ID: <CAJuCfpH6N_p-w2DxJ530txgTha6dTxQb3ANtkU-6h9pCpstTOA@mail.gmail.com>
Subject: Re: [linux-next:master 1059/1266] ERROR: modpost: "memcpy"
 [mm/zsmalloc.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 6:37=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   1fdad13606e104ff103ca19d2d660830cb36d43e
> commit: 6cf40170b919c155125793476778ae33d7e9c7ec [1059/1266] fix missing =
vmalloc.h includes
> config: alpha-randconfig-r022-20221031 (https://download.01.org/0day-ci/a=
rchive/20240325/202403252127.967BczRr-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240325/202403252127.967BczRr-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403252127.967BczRr-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1250.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1251.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-2.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-4.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1255.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-r.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-centeuro.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-croatian.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-gaelic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-turkish.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/jbd2/jbd2.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/isofs/isofs.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_deflate/zlib_d=
eflate.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-pcf85=
7x.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/pci-stub.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/mac=
modes.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/kyr=
o/kyrofb.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/gol=
dfishfb.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/virtio/virtio_d=
ma_buf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/ttynull.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/lp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/bo=
chs.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/floppy.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/null_blk/=
null_blk.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/pcf50633-gp=
io.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dax/dax.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/scsi/scsi_commo=
n.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/scsi/advansys.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/scsi/BusLogic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/scsi/aha1542.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/scsi/g_NCR5380.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/scsi/atp870u.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/scsi/ppa.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/scsi/imm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cdrom/cdrom.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/ch34=
1.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/mxup=
ort.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/libc=
omposite.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/func=
tion/usb_f_acm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/func=
tion/usb_f_ss_lb.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/func=
tion/u_serial.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/func=
tion/usb_f_obex.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/func=
tion/usb_f_mass_storage.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/func=
tion/usb_f_fs.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/func=
tion/usb_f_printer.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/lega=
cy/g_zero.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/lega=
cy/g_dbgp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/vivaldi-f=
map.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-rc5t583=
.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/rc-cor=
e.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/mr75203.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-a4tech.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-aureal.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-belkin.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-betopff=
.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-bigbenf=
f.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-chicony=
.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cypress=
.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-emsff.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-elecom.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-elo.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ezkey.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-vivaldi=
-common.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gyratio=
n.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-holtek-=
kbd.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-holtek-=
mouse.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kensing=
ton.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-keytouc=
h.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kye.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lcpower=
.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-letsket=
ch.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-magicmo=
use.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-maltron=
.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-mf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-microso=
ft.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-montere=
y.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ntrig.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-pl.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-petalyn=
x.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-retrode=
.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-saitek.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-samsung=
.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-semitek=
.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sony.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-steelse=
ries.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gaff.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-tmff.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-tivo.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zydacro=
n.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-viewson=
ic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-waltop.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_performance.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/libnvdim=
m.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/nd_pmem.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/nd_virti=
o.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/pcmcia_r=
src.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/greybus=
.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/gb-es2.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/siox/siox-bus-g=
pio.o
> >> ERROR: modpost: "memcpy" [mm/zsmalloc.ko] undefined!
> >> ERROR: modpost: "memcpy" [fs/nls/nls_euc-jp.ko] undefined!
> ERROR: modpost: "memcpy" [fs/reiserfs/reiserfs.ko] undefined!
> >> ERROR: modpost: "memcpy" [fs/ext4/ext4.ko] undefined!
> >> ERROR: modpost: "memcpy" [fs/jbd2/jbd2.ko] undefined!
> >> ERROR: modpost: "memcpy" [fs/isofs/isofs.ko] undefined!
> >> ERROR: modpost: "memcpy" [fs/xfs/xfs.ko] undefined!
> >> ERROR: modpost: "memcpy" [fs/f2fs/f2fs.ko] undefined!
> >> ERROR: modpost: "memcpy" [crypto/rsa_generic.ko] undefined!
> >> ERROR: modpost: "memcpy" [crypto/cmac.ko] undefined!
> WARNING: modpost: suppressed 154 unresolved symbol warnings because there=
 were too many)

I spent a couple hours to figure this out and I can easily fix these
errors by simply replacing the inclusion that was introduced in our
patchset with a forward declaration like this:

 arch/alpha/lib/memcpy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/lib/memcpy.c b/arch/alpha/lib/memcpy.c
index 0e536a1a39ff..3bf0cbac3091 100644
--- a/arch/alpha/lib/memcpy.c
+++ b/arch/alpha/lib/memcpy.c
@@ -18,7 +18,8 @@

 #include <linux/types.h>
 #include <linux/export.h>
-#include <linux/string.h>
+
+extern void * memcpy(void *, const void *, size_t);

 /*
  * This should be done in one go with ldq_u*2/mask/stq_u. Do it

However I can't figure out why the inclusion of linux/string.h leads
to the memcpy symbol not being exported anymore (you can see
EXPORT_SYMBOL(memcpy) at the end of memcpy.c). If someone can figure
it out please let me know so I can write a meaningful description for
the fixup patch.
Thanks,
Suren.

>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
