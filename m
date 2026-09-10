Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D1F48F84E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 14:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050017; cv=none; b=jc9yUE85Jaug7D58syq2gthzTidpSnnyFWYMlHW5keZtpaVYGNKZK/1oQ8h+vqR68XbPUjEiJzoBRZtST1f9MBojgPrz5n3Dl/mIwMIPok69FMiT0vAsbpC9PXeaMFUM8xQs+DB8z/58zr0U+jJlNf7LFXNuPgeBEEXRBUpx7wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050017; c=relaxed/simple;
	bh=sxif0wyfcq8H412Y4yshHq0FWsb1CQN9/MCMEpTGBR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Guim5ddgt+9hYq2AYbdW/S7pNsy5gfZ1sKW9gHdWEme3frQHheAvFxDxxOfCm+bTW5jFyYgk1uGcISOwIKXLYBM6Sk+kcRMT8ZFE/FxYFALVRzldjbYdYp7ykSXFtSzh7IdzKrqsDsX2O+peGPi14epZdbLC8ARXIQ/iE3BV114=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jn++zxOl; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jn++zxOl"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so11756828a12.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 07:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789050012; x=1789654812; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ps82SqA662Agvdiz6i2Ym/UD36gHnRMXTJ78ECl6KLc=;
        b=Jn++zxOlWS4C/qLqd6IsoKMrjDVFw74fUpaiVD2ZRE95pQ1u/hg7nbOL2qZNtuKxHS
         UGvG9Pgu6EMYBv5qRtz68/E4VSF86lfAzkjQSO9e7pD2uP1PO/ZFzrxkTW5dNalLCuSE
         aesh/h/3B6ftxiGgknrJquK+hZJM/P7BvfzJJttfF3NMzwVwN3eTFLgSnxhUN7Nadugc
         V9hUtjezau2Dj0R1Os4iMeWATcJP2bnASMlCf/PGKnbTwIs/R7bd9n5cCqigStGZKFFK
         2oX5hfvlNerZpkAWtQgNvCYU3ngxX8hGxqn6anAyo266/b0yJgxbZsRro6/JHOM3skvZ
         jIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050012; x=1789654812;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ps82SqA662Agvdiz6i2Ym/UD36gHnRMXTJ78ECl6KLc=;
        b=mNCceDBhtyAdxMcrlxCXWQYAkgTB6iwFhVGUpjCAlFBN4jF2PlVscewnXb9ym7Yigd
         pIWcQyEwnW5HqmwD5mT5IVEiPhoOSHdhTXK4Tm35AvCJ69QBtHU4C5BvD8QQ/Skk9HzB
         3SrrPO41RNvDxJFR6iBrGof05jpNwCdK0vow06j//ipmd7MLCsWgP7Kn4KRVg/rDwl1l
         FotSz/pGM76PxJ7A5gUjwhAqsglMxPU90ePCy2CqBUZ04+TeJJ6yRTxs3mRzA9hNFCtf
         v9DlsjirSDiySK2rYxhjEkaYUiB0fS37lKUmjl/6y1CQMF+ZaBEeV8DK6/O+ujgh7vz5
         ua5w==
X-Forwarded-Encrypted: i=1; AKwUvBwQCMXUr62vYeOYVBNC5Hn9LpRSaw8PF/A+Zfkon0Echx8/6eCqqxXg0DIUdUjcSd4i97pewLjaCQdkJ0CI@lists.linux.dev
X-Gm-Message-State: AFuF++nU3r93UEkYaZ0fiHP6XZsWJcz7LafupaUd0f4kakBISjjybif7
	HUIQ1nrS5KZE7zBqa3akzzA8Qy/AMn6P5MBx9ZaXpBD7YTK6sqkUR3V3
X-Gm-Gg: AYBFou0OqmRSMgJinLkcdI0KIQpDud7ZwigiFnEY8KYiHknwfsupQWp0k5gzrXS6j8B
	34zg5olgHkPMu5MckgXyHtsDQJ8cidLd/GblVk6OtKthQqqPNSYVCrXqJQAjI5uId7EzCf53k8v
	Zv02WHwxTa+Z+5IW+cze3GgsP2j3Afwf2HmvJz9LroXZNWfBcYR152QlscDIZDOq0Ss4GnY2d/Q
	VqOo4HX1hsD5yLixGUzAcv4B7e64zSUhIgNZ7bXWyJSgyoRC/hE+uNB35i5BQmJTbtJU4siiLOK
	VfGXCKvcDKIoSzSug1IbuBVftm46qL8xwuXhCoqzN6TPKQoS29HZx0XJY1BbvwL2kgyPGAitrFl
	teBM0I10ZwHq014okLVGTll0kHP9e7t2avM/ksjkUF6ZDBsC6EkqJCkK7M347u+dbtagS8BQzoK
	5udf+4F7lHyCOgsfzfXL5NQqoIS1RvMiANuw7ZKsjLIoaYD2D1LZ/nL/caqdZ20+VqZS4=
X-Received: by 2002:a05:6402:2350:b0:6a6:37a3:2b0f with SMTP id 4fb4d7f45d1cf-6a7e8d6e0cfmr14523801a12.8.1789050011642;
        Thu, 10 Sep 2026 07:20:11 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9857ce120sm3083667a12.4.2026.09.10.07.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:20:10 -0700 (PDT)
Date: Thu, 10 Sep 2026 17:20:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Neo Chang <YLCHANG2@nuvoton.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 1145/4316] sound/soc/codecs/nau8360-dsp.c:214
 nau8360_message_to_dsp() warn: missing error code? 'ret'
Message-ID: <202609081933.K4tVJnyh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   944a035ecca915ae947905dcfb03f2b9dc6d032c
commit: be88847a8bb1a14194cf50116f8909d127861318 [1145/4316] ASoC: codecs: nau8360: Add support for NAU83G60 amplifier
config: arm-randconfig-r071-20260908 (https://download.01.org/0day-ci/archive/20260908/202609081933.K4tVJnyh-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2362eeb5f75560740146975e9eabe84c6bd25a0d)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609081933.K4tVJnyh-lkp@intel.com/

smatch warnings:
sound/soc/codecs/nau8360-dsp.c:214 nau8360_message_to_dsp() warn: missing error code? 'ret'

vim +/ret +214 sound/soc/codecs/nau8360-dsp.c

be88847a8bb1a1 Neo Chang 2026-08-25  198  static int nau8360_message_to_dsp(struct snd_soc_component *cp,
be88847a8bb1a1 Neo Chang 2026-08-25  199  	const struct nau8360_cmd_info *cmd_info, int frag_len, int param_offset,
be88847a8bb1a1 Neo Chang 2026-08-25  200  	int param_size, void *param_data, unsigned short dsp_addr)
be88847a8bb1a1 Neo Chang 2026-08-25  201  {
be88847a8bb1a1 Neo Chang 2026-08-25  202  	unsigned int payload;
be88847a8bb1a1 Neo Chang 2026-08-25  203  	int ret, padding = 0, frag_cnt = 0;
be88847a8bb1a1 Neo Chang 2026-08-25  204  
be88847a8bb1a1 Neo Chang 2026-08-25  205  	ret = nau8360_dsp_idle(cp, dsp_addr);
be88847a8bb1a1 Neo Chang 2026-08-25  206  	if (ret)
be88847a8bb1a1 Neo Chang 2026-08-25  207  		return ret;
be88847a8bb1a1 Neo Chang 2026-08-25  208  
be88847a8bb1a1 Neo Chang 2026-08-25  209  	/* sending preamble fragment */
be88847a8bb1a1 Neo Chang 2026-08-25  210  	payload = nau8360_pack_preamble(cmd_info->cmd_id, frag_len);
be88847a8bb1a1 Neo Chang 2026-08-25  211  	snd_soc_component_write(cp, dsp_addr, payload);
be88847a8bb1a1 Neo Chang 2026-08-25  212  
be88847a8bb1a1 Neo Chang 2026-08-25  213  	if (!cmd_info->msg_param)
be88847a8bb1a1 Neo Chang 2026-08-25 @214  		return ret;

Please either change this to "return 0;" or "return -ERROR;"

be88847a8bb1a1 Neo Chang 2026-08-25  215  
be88847a8bb1a1 Neo Chang 2026-08-25  216  	/* sending payload + padding */
be88847a8bb1a1 Neo Chang 2026-08-25  217  	payload = nau8360_pack_param(param_offset, param_size);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

