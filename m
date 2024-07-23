Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE82625760
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 22:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721774932; cv=none; b=V3HnBDrPO+fbc0Pu9yEpOvx9frSQw77rWDEucYNsFh90aAScWSkm1IWqIsZ1UtA2V3zueK/RfLlTwzf5+Mei6xbJyiCmfJRDosHFAEYRdp98vtR8+zAQmJMApQsbkfKy7bdsAn9OVE7vQG4z8s+xQ1fCV1avl/i6FDp0D8vDP2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721774932; c=relaxed/simple;
	bh=Lw1ppcXSrPtjCxmEOr6gErZwtgnrMoBXS0ZVsxNdHLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lLzOtLaHJCaGefhqwx42RGj8BCR+JvEzACC1mzPikQjjnA60algL8HFmWNI06PVrkIIDRrYObu153dIoG5IOdF8LuAzxh7rXndXdRbIT+dEBUWYszwagZllC5HGQVRk13PLHb3Mc1apswmCzznvJfFwIernAZA0iAmZS++NsTIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2JgpH0z; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2JgpH0z"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52f042c15e3so312362e87.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 15:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721774929; x=1722379729; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ezg52eHclr4j0zq4BJBkryPVzNv/N9mlBGgYhA+rqMY=;
        b=b2JgpH0zb8LAwcAlguFlckg91hwMePxJ7Lii2AJIP3pudt/DMXM9qxcoFAGFE2k7Zt
         YtPPXdGWzCj1sbrxQ5+Y1PrbTQjpsPKUiKfJjc7PnIJbtZsosq44D3lELN4u8eHcek8v
         Jzm0KQ/HgmuKmCrUvfteWFNWv4yq4zWCqmWhGqPWhutfvpefRmtzdpcupPwpgqT8hfLW
         Js++fymetF9b//Sj64QKPkDTwEb3g69hJs5U33uXxnF9XS4GBNTrF7Ls4eI9TARc2egs
         wAMgGJgVRjvubnzOUaxvcRF2+TeuMo+bgllRDzR/yMQfaFOyURpJ6KNC54fT+xMI5lta
         sJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721774929; x=1722379729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ezg52eHclr4j0zq4BJBkryPVzNv/N9mlBGgYhA+rqMY=;
        b=Co/oT0OBtO9Qc7azcK1OUBw88z9acsBNUz1u75zEvsSb98xAqKFMr+lgu7uIURlSk/
         tcEPH430JpDrHc6D9zSoJQ04PmOIHPUyD9n+xFthaOsovzhuH5D0ndmjGddtWfdRXAqC
         1rTcLylbEJwVNYwWiteG+pr3Ngrf5W4tk3zrtmparjJZKyPRIOGQsJfAJuRbxxDbtUgJ
         JA4ia8fgjTOTvKgdD8N4vmBbEjSi6o48CjDMSituRcZatimhlGsMg5FmAWV6sbg5ZY/b
         ieXNcUuFmPw2CbUXZYKcnr+gO/IBCo1cQZNA2pDP9z2M8yUSWumfBPWzHGgU6Gs4czam
         5NoA==
X-Gm-Message-State: AOJu0Yx1WGlcmWYSM5jFgjtHpbIF7knWNyXlG+an1aFwS2kwDeleGqFM
	CrXe7Zy3SjJV31GVh5AclfS+QzpHZii0dJQXmdQBGb86RQldrHXoLxJBLPgDpohd0WtA61OrpjH
	2dz9Fj/Ahq1PX2/1laRjfs6QSgUs=
X-Google-Smtp-Source: AGHT+IFAWjl75rvRITC8oU1EWcaQCB9TEMTgIZzmojMWDMCmNyi/UA5XFvmezaW/1vinOlJXFxGZiwOoOEYB+w+nEC8=
X-Received: by 2002:a05:6512:3044:b0:52e:7f23:5d98 with SMTP id
 2adb3069b0e04-52fcf8b5068mr17989e87.8.1721774928873; Tue, 23 Jul 2024
 15:48:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407240638.kjmPxwJV-lkp@intel.com>
In-Reply-To: <202407240638.kjmPxwJV-lkp@intel.com>
From: Steve French <smfrench@gmail.com>
Date: Tue, 23 Jul 2024 17:48:37 -0500
Message-ID: <CAH2r5mtC6LAFJxvoeWe4DPAKx=01LdYRSO7FE0R_jOC0iVX40A@mail.gmail.com>
Subject: Re: [cifs:for-next 2/3] ERROR: modpost: "reset_cifs_unix_caps"
 [fs/smb/client/cifs.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fixed with this change and repushed to for-next

diff --git a/fs/smb/client/connect.c b/fs/smb/client/connect.c
index b66d8b03a389..89d9f86cc29a 100644
--- a/fs/smb/client/connect.c
+++ b/fs/smb/client/connect.c
@@ -3686,6 +3686,7 @@ int cifs_mount(struct cifs_sb_info *cifs_sb,
struct smb3_fs_context *ctx)
 }
 #endif

+#ifdef CONFIG_CIFS_ALLOW_INSECURE_LEGACY
 /*
  * Issue a TREE_CONNECT request.
  */
@@ -3825,6 +3826,7 @@ CIFSTCon(const unsigned int xid, struct cifs_ses *ses=
,
        cifs_buf_release(smb_buffer);
        return rc;
 }
+#endif /* CONFIG_CIFS_ALLOW_INSECURE_LEGACY */

 static void delayed_free(struct rcu_head *p)
 {

On Tue, Jul 23, 2024 at 5:37=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
> head:   dde12e91303b6d38322ed69801ce3129aba82ad5
> commit: 2a9b3eb1b0838cc99aafdc50e37138538d4593bb [2/3] cifs: fix reconnec=
t with SMB1 UNIX Extensions
> config: x86_64-randconfig-101-20240723 (https://download.01.org/0day-ci/a=
rchive/20240724/202407240638.kjmPxwJV-lkp@intel.com/config)
> compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240724/202407240638.kjmPxwJV-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407240638.kjmPxwJV-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_=
mutex.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in mm/dmapool_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in mm/zsmalloc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/unicode/utf8-selftes=
t.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/math/rational.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/find_bit_benchmark.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_dhry.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_firmware.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_sysctl.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ida.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test-kstrtox.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_min_heap.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_module.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_keys.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_key_bas=
e.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_printf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_scanf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bitmap.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_xarray.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_maple_tree.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_kmod.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_memcat_p.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_blackhole_dev.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_meminit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_free_pages.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/atomic64_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/qcom/hdma.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cxl/core/cxl_co=
re.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cxl/cxl_pci.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cxl/cxl_mem.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cxl/cxl_pmem.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cxl/cxl_port.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb_=
debug.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/mxup=
ort.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/navm=
an.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb-=
serial-simple.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/symb=
olserial.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_simpleondemand.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_userspace.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/pcmcia_r=
src.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/yenta_so=
cket.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/bytestrea=
m-example.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/dma-examp=
le.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/inttype-e=
xample.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/record-ex=
ample.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kobject/kobject=
-example.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kobject/kset-ex=
ample.o
> >> ERROR: modpost: "reset_cifs_unix_caps" [fs/smb/client/cifs.ko] undefin=
ed!
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>


--=20
Thanks,

Steve
