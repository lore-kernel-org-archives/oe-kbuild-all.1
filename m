Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9053202F70
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 15:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787845659; cv=none; b=Ngxof8ti55+BZyuFwxRf/2ccTEN1PZBfEbkvuA1OWj39ffNxzjXNr1YRXR5+3jrOe9Tn2OJ5m/9BmNxOWjkxmcr6pr6j4WaSGuvQRgTLMMmdArTLdFu0KxIT0pBlqIIc79WDBA/HwCOESA3IjOqTBPkTGDStxUVhs+oD7zNDujo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787845659; c=relaxed/simple;
	bh=90w2BBtQaZLSLVOGEx0Qgyd9eTcuPZaZ0qmHaHxGmrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e+BeQSmRvJHYbvD0JGaj538YnKvFh+qFx/E3wl4PrsSmW+IcaG85Nu36agSztKrXaeBnurbh9kcLLiroxt2P4M0lSwD6vKU9T8lor3NqzGjAdW7xdgug6+EVhaqEXWoYca+ej+eaWEGpUCr1Zpo0dRqiK3p3yOaZXNwPS1Ri/3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e5h6jZ3a; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e5h6jZ3a"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c252e703fa3so119556066b.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 08:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787845656; x=1788450456; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wa2i60EGHGZH6/3oD6Z+EHO/RZG2f2o08SMBupyzWYI=;
        b=e5h6jZ3aMSE8FWp9etyDDk2vWyEf7VM7nEAee3SSmNWlJsPKWa7DCqb7u/rt944xDn
         js3tHlhNspUVtnQLQ2+Jzx9H/KXkrKZE56oIQVwztiXgFmAUMWzDHUOB7ac2MyN75V3/
         Iu7YEM2CeXCLinzmo/urAF5rEMkCOxG9uMYug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787845656; x=1788450456;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wa2i60EGHGZH6/3oD6Z+EHO/RZG2f2o08SMBupyzWYI=;
        b=Pzlj9CA+4y6aro0FVoc+f4hEEIR7cptyS+jQcMyQbH295kUeRS/qm0JKPEvqfPEbag
         rk6/o7J2p+eyQ9d+N/MLMTxSmQTJnHp1emWhO4kUpboYLj+vtEi8SOpHmcyjH6ZYVs99
         l96dmd0tXDPXZE1/F9yCleFODQzUeX5Eqfk0Qw0QNHbbIWytIPxTO2BQUdZ3Rtj8VAfN
         6HZOTHci0MiKx24k7gl3n1+OgnHny3iwlstr2WdiFEWIQLuu12E7C7hr6QyYwufd5X6A
         4+m2CT9XFwiEAzpxeeMxHtff3TdeP4K2fJ9JLoOxN6mFzkDvwnqsA/GhTB7jazvbgPBM
         QFDg==
X-Gm-Message-State: AFuF++lCKf/1Eof3UiqQrcvdBH64P13KR0A+SmuST0xjHSLUpcOCcoR9
	ssSt3zYxSIcEnpmwYGIQ1szAssiju7DwKsSUK5uL8Kv+vuhDPMB01YpmNXcZ2q54TimYt1v77qg
	oWSt/gA==
X-Gm-Gg: AR+sD13E2rhCFV72R1Z4hG4CNicD6t1B9CsGX+wLo5Hl9ce715Jdr6ud1F5tLttmb+Z
	LIlq6nTLP19PYoamNder80qw8N1hBDMAkKVPASHT5bbjY6PhF3lYp90ptqRBCNmCUm6n+Mby1bn
	98rt5Rm2apYJjJq/Oepr0Z4tf1sNInw7JCbZ/AAkzloeex2DeutlH+3XaXB2sPRvh1qnu0DwQX1
	vp1gg8QEv26zwfoqxcvCpWLpVbs5WYAgMbYU6jxnO75Y3X9NydmjQ9MxusC6Hbg4kG8pSFvIJYz
	VY/8wZ1srswK4BCWc3bC0V9oWmNtMgE79S17ca0ePUf7pzaazOAbh64sf+AuXaEn0lne+t/ELt3
	AZdETUq9bITQRrVnmk5I4zE9NmV/hWkDAahQCkXJEOtPHzz7M99gxG5jtawjeAQUMxLQvXoe2cP
	SgCA6HOSUCful0oTaxuHtdhczPWGc63EMnbNVMUCQuIu1lljlVjW5USd1OM4kAiGK+iL58YQwlx
	QfW28TxZDuz1OagXelqZHNVJTu5WEbrOPi38Q==
X-Received: by 2002:a17:906:6290:b0:c25:32b0:e56c with SMTP id a640c23a62f3a-c2532b0ef77mr938002566b.4.1787845655748;
        Thu, 27 Aug 2026 08:47:35 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ef382sm655093466b.58.2026.08.27.08.47.34
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 08:47:34 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-480001972b8so470423f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 08:47:34 -0700 (PDT)
X-Received: by 2002:a05:6000:2507:b0:482:c5ee:c7a9 with SMTP id
 ffacd0b85a97d-482e26cb8bcmr18214476f8f.17.1787845652896; Thu, 27 Aug 2026
 08:47:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202608272312.xpie6XDa-lkp@intel.com>
In-Reply-To: <202608272312.xpie6XDa-lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 27 Aug 2026 08:47:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XbqrLPDB9EviJ5h0jWv4XDR_ujkCmqaUcHFTL8zeiUVw@mail.gmail.com>
X-Gm-Features: AcwNN1UckP5p1IBxZ4XgRFUhGENwWioyveXSQ9ysKwD2ZdTKBnJmUXEbeK6lNsg
Message-ID: <CAD=FV=XbqrLPDB9EviJ5h0jWv4XDR_ujkCmqaUcHFTL8zeiUVw@mail.gmail.com>
Subject: Re: [ksinyuk:drm-tip 6/12] amdgpu_dm_connector_test.c:undefined
 reference to `parse_hdmi_amd_vsdb'
To: Alex Huang <Alex.Huang2@amd.com>, Mario Limonciello <superm1@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ruben Wauters <rubenru09@aol.com>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 27, 2026 at 8:31=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ksinyuk/linux.git=
 drm-tip
> head:   e3e05bddbe9fea67639d2a3551e7cf2d473b804c
> commit: 6fa42e05f7e63d41ade0e59fa5d94ca8028f7887 [6/12] Merge remote-trac=
king branch 'drm-misc/drm-misc-next' into drm-tip
> config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260827=
/202608272312.xpie6XDa-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260827/202608272312.xpie6XDa-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608272312.xpie6XDa-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    /usr/bin/ld: drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_con=
nector_test.o: in function `dm_test_parse_hdmi_amd_vsdb_no_cea_ext':
> >> amdgpu_dm_connector_test.c:(.text+0x8cfe): undefined reference to `par=
se_hdmi_amd_vsdb'
>    /usr/bin/ld: drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_con=
nector_test.o: in function `dm_test_parse_hdmi_amd_vsdb_no_extensions':
>    amdgpu_dm_connector_test.c:(.text+0x91c8): undefined reference to `par=
se_hdmi_amd_vsdb'
>    /usr/bin/ld: drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_con=
nector_test.o: in function `dm_test_parse_hdmi_amd_vsdb_null_edid':
>    amdgpu_dm_connector_test.c:(.text+0x95ca): undefined reference to `par=
se_hdmi_amd_vsdb'
>    /usr/lib/gcc/x86_64-linux-gnu/14/crtbegin.o: in function `deregister_t=
m_clones':
>    crtstuff.c:(.text+0x7): relocation truncated to fit: R_X86_64_32S agai=
nst `.tm_clone_table'
>    /usr/lib/gcc/x86_64-linux-gnu/14/crtbegin.o: in function `register_tm_=
clones':
>    crtstuff.c:(.text+0x38): relocation truncated to fit: R_X86_64_32S aga=
inst `.tm_clone_table'
>    collect2: error: ld returned 1 exit status

Not that this error seems to have anything to do with me, but I did a
quick grep and my best guess is that the error you're seeing is
related to this patch:

commit f65198b3d07389afdcb48e4ad00fea2aded95dfd
Author:     Alex Huang <Alex.Huang2@amd.com>
AuthorDate: Tue Aug 4 10:33:37 2026 -0400
Commit:     Mario Limonciello <superm1@kernel.org>
CommitDate: Mon Aug 10 23:26:00 2026 -0500

    drm/amd/display: Use HDMI FreeSync range from common EDID parser

    HDMI FreeSync on amdgpu is detected using the AMD VSDB parser in the
    DMUB firmware, now that the common DRM EDID parser can do the same, use
    the common parser.

    Extend get_amd_vsdb() to copy the relevant flags and data now being
    extracted from the AMD VSDB. Additionally, parse_hdmi_amd_vsdb() and th=
e
    parse_edid_cea() firmware helpers now have no callers; remove them.

    Signed-off-by: Alex Huang <Alex.Huang2@amd.com>
    Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
    Link: https://patch.msgid.link/20260804143339.714548-3-Alex.Huang2@amd.=
com
    (Adjust for movement to amdgpu_dm_connector.c)
    Signed-off-by: Mario Limonciello <superm1@kernel.org>

That seems to have removed the parse_hdmi_amd_vsdb(). Despite the
commit message, the function prototype is still in a header and there
are still callers to it in amdgpu_dm_connector_test.c.

Adding the two people involved in that patch to this email thread.

Seems like the kernel test robot could use some help identifying the
proper patch / people involved.

-Doug
