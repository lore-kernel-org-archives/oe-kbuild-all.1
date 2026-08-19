Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3D3313E36
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 15:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152718; cv=none; b=C6/jLDSsIyM9XT3ldmrpk1abPV1nvQvjFAeibcWichi3BhlcLWEzrC3O44cIwhxGuvOSQXTpELT2cSgRJYjO8/8L5FPxtPBD2O35ivmmE6dWGF08DXE/s/Hxwm0aK6zz7iAmg/sQljF4k/FKHk1lYQHZ/tcwLTX3YqA/C/9zFlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152718; c=relaxed/simple;
	bh=gOf0YagccmWK7tZLyVxY3QFPMuVRX9kanE1cA/OJfAs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sKDqt54q6oBllBRbyQbux9H7TqDtaWUW1lWZJnOdW6ZWkZrISrnKWy1UhbAiJ5vxDyp0HDjfH5v1OM9h3i4023VdUQkWULR/9cR0sTRLpxcrnKIhLArT5o+3zYcmrTmYdaDgr/IjeoBSYhIF4sQ9mk85t7c84nHYhBOJ5VlITsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cpcit95A; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cpcit95A"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso9929005e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 08:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787152715; x=1787757515; darn=lists.linux.dev;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7WqScVCeS+a7glckgdS/6loW4vfP0sMFFNekds3NfA=;
        b=cpcit95ASKYeYnLTbeFdyVy1ceIR84dlkTcGKh4S9ziMvw6W+zC/BmxdPgHZL47Ss9
         5pJOP/XEnqD64FmSnffd4aCnAY+GhcXR3ZT4Is2XIpIpcraIG7Du0rbs29pEhaa/ucBq
         p7aqkoXuucslF3Psor2mY1MHSN0BezUpnNnfhQnWQsAybGyFaX4ByQW9zfcmGzS/Fc2/
         SU+SDoaJqW++bvPwy5GmCL0N8FXOW6KDmVwrMaSKZXvUXmYQsgqruLJx66BLJQa2nc9P
         HNP70jD4z9BiMkeVfxZji+CKc9X9nEGfRYDWccAZp8KNNrw12uynaUDn23NUiV1Y3sAP
         rNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152715; x=1787757515;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7WqScVCeS+a7glckgdS/6loW4vfP0sMFFNekds3NfA=;
        b=l1eB7rU4vtATuKSpsx0bsUeLCl+l/LAa33zp6S5OwBafsLqcmrGe+oR7lrX46GbGgz
         eKc0vQmjOiI5RtZSfjjN4kpNuqGcl7WKj+80GCue6jhe9huNiO7NBVXjC5Yrp15q1hfi
         kij/wN5xuSRBLVX5N4LzHNHhnMvUIgcHHC5UUCRG8RX28JGkZpglC6ms9JptLC6sn2OM
         3K9Iygyge+65Vkp7tocb2v0ZAmZSf8It2kN69KT3FYMp3nVftFWYkmpvsbY1c52pqxhm
         g3M8cq2rTUuzB31for1PArkSk68u0L15U94/m8aI+ShP42Q+MPhlyyclylK+uFNOPVYU
         SrCw==
X-Forwarded-Encrypted: i=1; AHgh+RqGyzBJ3cedfJZhMuzy6oiuQZPuTCl0Ba7iTTZqnvs/VS3FvKUQdwqFZuuVP00abimALyoIDP1PaPA+Btgp@lists.linux.dev
X-Gm-Message-State: AOJu0YzEeSxsFQinbn9BPK7Ndib8YmkTyutgJQ0sm148R4gsESbCcHep
	Q8HpY7F18a20dgAsVwV9kBgpdVATrVEY5RRFh02qxA65fsgViEhWHXu1odDBh3b3bUc=
X-Gm-Gg: AR+sD1378zL3ECwdGpw7VbeSr/uw8isUSC/wI0IC/860mDXdirpepWH3wI1FU3YZMHb
	8S33rMwYNBOSRMEvJyU78Ve3Aw4nDHlYVFU6Gj54EFoWB6mRvVXwH1glz95rVJotCFhqutBid7A
	P3Iqvr2sX3CtwpnKDNU6lorjdwCB49RvgvOYs//GHtSxuKN54dNSJcsuAwqtQa+zF3cJimUgiU9
	QQIyr8mX6Uc8ofBV4BLQ8pHZ6lUzJ59UadnInkzRENePSWub6/FpP+LaMNepy2x/0GwBCMwwCc2
	uxBZJLmN5E+M+z4YLjwQPT+iO+/RiCwmdyyK6jkaHiKuvDcyyTOrAJu2Bb8Y17pZS07M++YKJcm
	13KPKMebX1Ad3SMZoKWHuM86T1Oa3Ebx6YFxObtwERXSn6BXgu586smYFIkyZeDbdvWEBglc0E9
	gqNqt/1Eob7aHvFhVBYPFecwLiP8VQ9tDlvWCFtgASH88zlydVECPCJZsltowQ
X-Received: by 2002:a05:600c:468a:b0:496:c9cd:e7ab with SMTP id 5b1f17b1804b1-499aa172377mr80538435e9.5.1787152715297;
        Wed, 19 Aug 2026 08:18:35 -0700 (PDT)
Received: from suse.com ([2a07:de40:b240:3:dd0d:de41:dd0d:de41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e805a4sm74018695e9.4.2026.08.19.08.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:18:34 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:18:34 +0200 (CEST)
From: Jiri Kosina <jkosina@suse.com>
To: kernel test robot <lkp@intel.com>
cc: Michael Bommarito <michael.bommarito@gmail.com>, 
    oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 10759/15982] ld.lld: error: undefined symbol:
 kunit_mem_assert_format
In-Reply-To: <52q8853s-5r61-p770-0pq8-770588pq4956@xreary.bet>
Message-ID: <r7n438s1-197p-s0pq-6941-59qoq143ns29@fhfr.pbz>
References: <202608190536.d9qCkWWc-lkp@intel.com> <52q8853s-5r61-p770-0pq8-770588pq4956@xreary.bet>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Aug 2026, Jiri Kosina wrote:

> On Wed, 19 Aug 2026, kernel test robot wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   e6664f2b33db9b6811eb4cec109f06cb2b4f458d
> > commit: 83df7b5fa6735b5084ecd296a0f67208650ba497 [10759/15982] HID: hyperv: add KUnit coverage for device info bounds
> > config: i386-randconfig-r123-20260818 (https://download.01.org/0day-ci/archive/20260819/202608190536.d9qCkWWc-lkp@intel.com/config)
> > compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
> > sparse: v0.6.5-rc1
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608190536.d9qCkWWc-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202608190536.d9qCkWWc-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> ld.lld: error: undefined symbol: kunit_mem_assert_format
> >    >>> referenced by hid-hyperv.c:697 (drivers/hid/hid-hyperv.c:697)
> >    >>>               drivers/hid/hid-hyperv.o:(mousevsc_device_info_valid_descriptor) in archive vmlinux.a
> 
> #syz test https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git e6664f2b33db9b6811eb4cec109f06cb2b4f458d
> 
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index aa7fa11a0197..1f294064515c 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -1253,7 +1253,7 @@ config HID_HYPERV_MOUSE
>  
>  config HID_HYPERV_MOUSE_KUNIT_TEST
>  	bool "KUnit tests for Hyper-V mouse driver" if !KUNIT_ALL_TESTS
> -	depends on KUNIT && HID_HYPERV_MOUSE
> +	depends on KUNIT && (HID_HYPERV = KUNIT || KUNIT = y)
>  	default KUNIT_ALL_TESTS
>  	help
>  	  Builds unit tests for the Hyper-V synthetic HID driver.

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git e6664f2b33db9b6811eb4cec109f06cb2b4f4

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index aa7fa11a0197..1f294064515c 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1253,7 +1253,7 @@ config HID_HYPERV_MOUSE
 
 config HID_HYPERV_MOUSE_KUNIT_TEST
 	bool "KUnit tests for Hyper-V mouse driver" if !KUNIT_ALL_TESTS
-	depends on KUNIT && HID_HYPERV_MOUSE
+	depends on KUNIT && (HID_HYPERV_MOUSE = KUNIT || KUNIT = y)
 	default KUNIT_ALL_TESTS
 	help
 	  Builds unit tests for the Hyper-V synthetic HID driver.

-- 
Jiri Kosina
Senior Director, SUSE Labs
