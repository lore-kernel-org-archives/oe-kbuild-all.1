Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9006352016
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 04:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152321; cv=pass; b=BDMe8IINZ+U4kZqPLYNY9brySL1oftUcHpIsa5ZZGQhLfIagF9H8zbeZR5H0uQEITWhbDYMG0VMly+3SEBVj/4eQyXUvdGkD25YvB9plnsuQ/ST+R+oolpB8l8Eo8xeqSS+zJAI3k2S5j2TxIm0qm79znegk+JDOh00nuzJjoow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152321; c=relaxed/simple;
	bh=3C2R6LYfOqhNQ/EJlkOC9oZNoMcVsUhyHH1uvi7df04=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UTQ6hoYl+CX1wgk6G/iFqqSNFxZcuhn7BHt/KDXK1GUW8YjEpdX46xlOeGpDX4GA/598JFwS3sMHYBBVBthjI6jhjjKHFMlWxE2dL6ewyJhTinrrtF1FvptueiXH/7AeIFoF5lRnplFLpBP3DpWTP7loFz+AKt2vTph7b1hYxz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qHMX3Uji; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qHMX3Uji"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a156627e22so7353363a12.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 21:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788152318; cv=none;
        d=google.com; s=arc-20260327;
        b=Ab5/wpnKULnorS2Udr/cTtcgtG5op3DHT9iclG80OBEwM6bSqYs8mXlOcfOHtkXJMI
         1/9kc563cHM609GAu9gYgJN9Hy1fLHldzvLziYEdjQdJ8bcXL7Ls+SefiSjlNnEt8P1b
         H48z2HiH+W0e102LBbDU2qt0vvKNVEp5Pd/fwGipVta56pslPmGaot6ZTxEHXav6942I
         econro2NglO2AferXonsYlgX7itBIGXhFitfxAIFKUHU79bFVIoTkqMLQC5HwBrxGlSL
         GHTn4Ix5o0ty+NJHgpL6B5BAq0xZJi2ojZMlLMGYey0ppVwSWXQNErnCr6SGe49gnurj
         /HTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=3C2R6LYfOqhNQ/EJlkOC9oZNoMcVsUhyHH1uvi7df04=;
        fh=9Qzo/MmqeGHXLBQLInXZjJ+TJR2VLfVDsWEBtmMVJwE=;
        b=khzQwteaHBXFscHpnYeXxMVmQ6DkzX1M5j3jk/cnykNnPIxiErrc24Jz3liW7me85C
         DSwkKC9Eh9yr6fxU+VmWxPnUJP/6VJNLoA4B0Tkv7H/sFXuETb0nxgxsmgdZKYok6JI2
         JnfgDIhvblv4PoTgiew+smz/WtXdD29zS5cmPRPI9O87po7+Zcvh7tl3KaFXp/IRJK+P
         uRT63xGIg4WvVf4bc7XyZiIyGxJHZe3YPBft1DJQMiOxwYV3VtuOfkYB6VYQ99lSJNFU
         HDL9EbTOpoW+iwZ0ySk2kqfVJVS9CH35Owpplifd9PxJnfdIWrPApZeYxI866WZC/FOq
         7vog==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788152318; x=1788757118; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3C2R6LYfOqhNQ/EJlkOC9oZNoMcVsUhyHH1uvi7df04=;
        b=qHMX3UjizaxiB5CphrVE9tZ3LTu0Cc4ZYq/twiKuL9+OA8AL3HkqGJH+rTD39nO5iE
         xFK6Jd84BoKmPXI2xCl3sfwH411gGNVAoEDOo5bUpVLZQwpxnw+OW8TMAKT1jN2yeSWa
         6/Y3frQ1ack1j+BkEdPC5idnu51tMIcivTrVSztdJqQC8z9CxOc1p15+M2684oEz4obl
         RH08UG9T0/0IHHTVcELpgeOdQ/JzSrWjP9iEXUguhSNn/3IHeH9aAHORtGaq17ESUTLp
         gz4VX/GPzaWVuCztCGI5wrh6d0uk60xWLUyP+WIF4ir3C8we/ug5w4wrFdEBhb4OVhYS
         rPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788152318; x=1788757118;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3C2R6LYfOqhNQ/EJlkOC9oZNoMcVsUhyHH1uvi7df04=;
        b=Z4K378uLJHNvVL2SANJIg+UEZ7/uqUCs04imwp9L45NsgqxHqws+shCrHSMWZbPvOZ
         oGMZH2NnVll5uOs1livnANA0l0CdGhxpfUyvtBOgcZoR113R/y4XXTjKB3aTKxbmCw8D
         wTYMTa06emChD7weIfLqhBdyo/+R1sYspMAJ0i8Js16/qfi1ZanSniIykPMIUldNToYR
         H4B1ETPc+5qpug/U4Zm8b9NEgoOE/tPdoSY1zcMF/AXdor+lqvDam2xCGV237srbHH47
         b/AuZ7+baaDseNQFUrxts75O6sp4kVziocPjlWOGQX8NuoXPAV1DCyoTT0M03OI0+zc4
         vB2w==
X-Gm-Message-State: AFuF++m2ptPoMIleeBcYOp2+a+XN6W7/ceykjQ8Ef2aI/4bWBS1FAT8t
	DtE31x+H0+GD7QM/cebNC4QgMNpdrA2Ut0bf8NJPtbzZk8df3fzfPz1YaiPZFrLZzqmgN2yysUZ
	VLScOc6rQTH1xpUbAQowwXasrDy5YAqe+W2xa
X-Gm-Gg: AYBFou12tyO8V2r53sJx4+h32wysqLA+QcnBEHqVSKIT4eK110bKXL5q/skGFXVZvbc
	4aWqAAIIrW4KBIfcbmJ5KnuoDVfJ23a+tUSzU616QvzV4Rsn3NR5v8/tRTjWOq2Zakde7I4Mi2E
	CSW0czA8lFABS+RDIK92WHy9+iT02YlrS6uRbRxAhEXLghqVnYox3yWQzHg2gbZkig4UqmPKJyH
	JePVtg/DS0wx/4vywJzzZMr7pOXscGIAh9+F25mOF4rgYMehmy5frxXWlaRAvCXvw8OlNdC3Tin
	LJcLUN5R7hHkCh3ni6Q49yCSltOqWcYnp14B2fOlSn6jLy8E0++JbEhUxYQThFbqVc/lmBDHZgv
	1daE=
X-Received: by 2002:aa7:d7ce:0:b0:6a5:d284:1134 with SMTP id
 4fb4d7f45d1cf-6a6476996b7mr2292703a12.2.1788152317739; Sun, 30 Aug 2026
 21:58:37 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 06:58:37 +0200
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 06:58:37 +0200
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202608310236.uXxkLfk8-lkp@intel.com>
References: <202608310236.uXxkLfk8-lkp@intel.com>
Date: Mon, 31 Aug 2026 06:58:37 +0200
X-Gm-Features: AcwNN1WhPUL0nna4HS2-tIwZcGrn6eOTTd0JwNrL8x0g0DiDTpjDhdmnzulN3_o
Message-ID: <CAH=xXfEXaY8vaW=002+hu03aYCgx3KEADeek6i8yNqHEgRo5rQ@mail.gmail.com>
Subject: Re: [chao:feature/kelvin_subpage 21/22] WARNING: modpost: vmlinux:
 section mismatch in reference: filemap_unaccount_folio+0x338 (section:
 .text.filemap_unaccount_folio) -> task_iter_init (section: .init.text)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Thanks for the report.

I checked this warning and believe it is unrelated to the F2FS change.
The patch only modifies fs/f2fs/data.c, fs/f2fs/file.c, and
fs/f2fs/super.c, with no section annotations, while the report shows
the same unexpected references to task_iter_init across MM, ext4,
btrfs, jfs, DRM, and other unrelated code. It also contains __ex_table
references to .debug_str.

This looks like a MIPS clang-24/modpost relocation or debug-info issue
rather than an F2FS regression. Could you please retest it? I did not
make an F2FS code change for this report.

Thanks,
Kelvin
