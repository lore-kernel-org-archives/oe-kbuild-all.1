Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A8E36828D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 09:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406253; cv=none; b=MuUrGcUyG//EYKliUDrXrTc8LvE0m++Hz6ZC4qaNsVh0d2Vgl9SSD6yu8IFz1iHHnmR09bBe5EoyPH+7U6Rbk6dO9KYgXPcESlTgsbt/29WF2gQgJvysFX6crjY5121gOWXKnLB9QpgO/6neb9LQKOb2dYAtZOcns3vYYgOjQv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406253; c=relaxed/simple;
	bh=qyRvU2ewFxk+SOvc53gWA+FNMrni3HtycJO+LFdYRPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tnNq61xSpHbG78xsvue/FaCzF2byWJHx9G158EVTuS4AofED0aJqtu+6p2wYaec56w/XJdykPf05E28zdhZdGvtbyBYxNdjd2I1wCNTaE0mHn8Ozsol0eIpw6l3Ga+Y4BdX+F7k9/Cd74lsHmNb572n/LLOaoCRqKWDBhtMTA+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQ7605zJ; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQ7605zJ"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50fb8e9a4edso37914641cf.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 02:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406251; x=1779011051; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bg4KSW5FUBoXpSa52FLrPJXp+ik2dKNDav8nStgOYuQ=;
        b=NQ7605zJBdm8QPviIGk8nB4PElQqntXtuFCSLb7pLwa4jD3Zy6/WRClELt+hqSdrzN
         L1KQTlT6l7y3Vkof8DtrBqUWdUP6a/rpmuQz8BgkTjWGsXwf7PGSLWOSZ8XM7RXf6Ga2
         hS6D1jbq8SY2oOlAqJKzav2KtWay4PiXx3x1eGHceyoNa8XeRFNC6m3n7BreLnopKvec
         rN4fNAlUzcwilJwg1m+87w+Glu4M/yvgiwHrNIn94Ds/FkoendDyGqcmtX7WGfm0SeSe
         xbXnak9MNk7Yp3FLp+FjO985jmxEpXtayl644iVKJOZ+tNJaSwHy9VRwVHLWeEHpUBod
         Omeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406251; x=1779011051;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bg4KSW5FUBoXpSa52FLrPJXp+ik2dKNDav8nStgOYuQ=;
        b=V1h3b1AYrOJMPCVb7a41yWiIcG3PVI6iyVXvKi4lvKlSA61h+j9gwAs8URIaSwB2r+
         rPcR1YEU/pCf9gACRo4j15PAORlHSY/pznc2cR64pvbhxBNm4h4osoX58u2METyvmFMN
         k4SFuFY0hzFycbsyNcq9ckOTSipLTPE4NK5EykdY9uk9tIm/4rPURdg4kAAcCw5Cr4JT
         BzK3iY2ah+bgQVDh5XwlYpVqMGK7GKJr7Hk9LlPa9vYWoMotIg/legR9KsQ8ctKV4Je4
         n0bLlpVN5/Hg6HpJlTsSlclQefcNQgtmv952+1uGVWt+gCsq8QkcCxyo00mpINAqDHUd
         F+6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+tW5Nf8D2K5MS/OAv67bqzyP+w7YkHiadWZiNNLqwVICNLJjzYlIfSAPy/CMmYFazsMNykUZiEDhtiDq2u@lists.linux.dev
X-Gm-Message-State: AOJu0Yze/rExCyng7pS0l4jr8FhfTVHj96+ghZ7MnIbPkJqKblymU1hV
	pxDj9DCPym+Fyxwn7exdPCjHqlyz1m6EAIjnBUgYJyb4k3EJp3Sa+UJA
X-Gm-Gg: Acq92OEZEt+V5koS0esp9KTefB2dgh/Ew4T1vBXRSWbfC6eGJPzSQMNGdOzcV/ExS7o
	APYuctSkDKGkcHHz+YPg7B+cgUGzb28C1GQMcHrGoyKC+CaLachxVCMkTQGotjgoeeERjo70VUn
	EcJ7hd/C0zPhMxaZt3zmQyU0cUiGseP3A4HLJqK82qKBOCAPHQLOgZN1DshG0sugh6rvSeTbv3r
	P/OcD8C+4x1kQtIiKlC7myBs81E4p7gBHEWSYFvV0wkSbbKnXS7P/MF03tacpcn9k8UTSvjQdyy
	bqYbD323RNzq3VXymwuUSrgYfp/GmAxg64zHz3yRO0GY9kZ2HlyNeqBUFdXl2CWryFKe00GtsAW
	qaVX4ounlu58f2WFWOhsDdvp2R4BeNUmR64lqAxvu1TZL7DMd3yDNfO+CFzRMEelZ85sevWd5Vd
	s1UJlunt9UMmB1nmBZOA==
X-Received: by 2002:ac8:5acf:0:b0:50f:b9e6:e056 with SMTP id d75a77b69052e-51461fa413dmr281528671cf.29.1778406250667;
        Sun, 10 May 2026 02:44:10 -0700 (PDT)
Received: from localhost ([185.141.119.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c7accddsm281442956d6.36.2026.05.10.02.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:44:09 -0700 (PDT)
Date: Sun, 10 May 2026 12:44:03 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Subject: [linux-next:master 2646/4394]
 drivers/memory/tegra/tegra114-emc.c:520 tegra114_emc_prepare_timing_change()
 warn: variable dereferenced before check 'timing' (see line 515)
Message-ID: <202605100506.wJFmI6IM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
commit: dce208b5405f40c36320bb0ee07e9df8f7f2bea4 [2646/4394] memory: tegra: Add Tegra114 EMC driver
config: um-randconfig-r072-20260509 (https://download.01.org/0day-ci/archive/20260510/202605100506.wJFmI6IM-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605100506.wJFmI6IM-lkp@intel.com/

smatch warnings:
drivers/memory/tegra/tegra114-emc.c:520 tegra114_emc_prepare_timing_change() warn: variable dereferenced before check 'timing' (see line 515)

vim +/timing +520 drivers/memory/tegra/tegra114-emc.c

dce208b5405f40 Svyatoslav Ryhel 2026-04-27  507  static int tegra114_emc_prepare_timing_change(struct tegra_emc *emc,
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  508  					      unsigned long rate)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  509  {
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  510  	struct emc_timing *timing = tegra114_emc_find_timing(emc, rate);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  511  	struct emc_timing *last = &emc->last_timing;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  512  	enum emc_dll_change dll_change;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  513  	unsigned int pre_wait = 0;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  514  	u32 val, mask;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27 @515  	bool next_dll_enabled = !(timing->emc_mode_1 & 0x1);
                                                                                  ^^^^^^^^^^^^^^^^^^
Dereference

dce208b5405f40 Svyatoslav Ryhel 2026-04-27  516  	bool last_dll_enabled = !(last->emc_mode_1 & 0x1);
                                                                                  ^^^^^^^^^^^^^^^^
and another

dce208b5405f40 Svyatoslav Ryhel 2026-04-27  517  	bool update = false;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  518  	unsigned int i;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  519  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27 @520  	if (!timing)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  521  		return -ENOENT;

Checked too late.

dce208b5405f40 Svyatoslav Ryhel 2026-04-27  522  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  523  	if (next_dll_enabled == last_dll_enabled)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  524  		dll_change = DLL_CHANGE_NONE;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  525  	else if (next_dll_enabled)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  526  		dll_change = DLL_CHANGE_ON;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  527  	else
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  528  		dll_change = DLL_CHANGE_OFF;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  529  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  530  	/* Clear CLKCHANGE_COMPLETE interrupts */
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  531  	writel(EMC_INTSTATUS_CLKCHANGE_COMPLETE, emc->regs + EMC_INTSTATUS);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

