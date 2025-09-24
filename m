Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F0A2DC773
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 15:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758726305; cv=none; b=mjad8S284UP1QKikCQi91zewd9AGDFewkEDLyRJVQWsUFTXM5JJT1BB20mMSC90gBWBy8iSaC/c3OWNxqUQU1LysYxl6R22vATlB8gbNfea7r2PaXRCO8MgZyACz6f+rA2GoMVitqJRPR5kYnf07P4bC9m7wDOIZ8CT2CMg9rXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758726305; c=relaxed/simple;
	bh=Qqz52OFb5c570gOa0Z/CYT9oJ7f5YAtJOsg0XT9EC/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=JNeEwYeTpDTY0VgWTdc9srDtVO32MwkJYY9YodBsHR5BQzKDkrrmw9JXk29SWCgpdIRVORfry9r91UPB0I4/q/WfK+MIqLc/aohK4QYNJkCss6Fj+ZhE2JtuNIprf5LNBAQjK0sO3H7UOUDzin6RS8xgPLz1RpRyyRIK4Y8RUfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H+En+UkH; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H+En+UkH"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e2562e8cbso13087545e9.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 08:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758726301; x=1759331101; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xtQ58nilsjUFvi81rFIHT0NM76qux0KSDZHaVgbUBdk=;
        b=H+En+UkHiapAhfnBNcpnCxFkdyQ1gfO6lR63LdNiBuIiwIW3hUC1wDrfkcxlklve8F
         7jtGKGZRfyI2Zg1/MgvgvWo0aGiZrel/pEzLDsl7T69Xj/H4kSEOZMuyfNxuGr4dWdEl
         36RHOTWiXDg2yiXj3hCLpPMgAQzAMqXpgL8Qa7UnxnxqwcwGx10HE28DelFXVCm/+nJt
         uUXMXnyyYZh9t9oeO3XOvWoT6h6V0W146cwoypRhb+T2gG+pwZwsMoS/BpkRiS581v2W
         XZ7zP+E+J6dhv0nBt2wml8Tw2Qqqyrf+D3cUfb1ZLFmm0S/RPW/7RlMB6MOK+1sCZ0eY
         0gcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758726301; x=1759331101;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xtQ58nilsjUFvi81rFIHT0NM76qux0KSDZHaVgbUBdk=;
        b=osRJ6eA//PpnUf7rr0fPOhV6h4aLbyd5XgsWNeMNIZpHA/bkkUKunfCVjuO8wuAEGU
         45VP9A206ydfoTkUD7VdQsYBfWkXGg7AHaPDyfgmFvxKrVkJPKjLqqa9CXOVn4UB4LOR
         laeEQcUsuGqEEJRmIl76WNZi8mpn8MAB6Fu/1lgT+xQfRAjGVSvHYZHMGB8mg5kQwTvL
         SQHy0+yXPXQrqyq9DyBcdNrBml+OhRq/GU1mq2n7TojeIzFsGYZtbNqm52HFBn0yzT/s
         /yVGHg+YQ7LGIMUvhiWQ5Xx7wfB8HRs0loZUCfyq78qbc1hiHWsAp43gWpzB+hnvrj/m
         EWZA==
X-Forwarded-Encrypted: i=1; AJvYcCV17TG71zTnyRhukb+U7oxl5PXkJ8mp9Qzjh+MTr4LUs8V4Ys5SpvefsiNidzeIYYrkkpMUdrvjYkLkPoCE@lists.linux.dev
X-Gm-Message-State: AOJu0YyqEFfLUTcoJgNj43786M/4jGEqq0UhB9p2fdR45bYA+IlpH3wR
	3XeqzgGxBgOYLbCyJYOrGUCBJGbfNCR80qjUa7cIbiTlcRH3tgpQbNal9L1A8jG4n64=
X-Gm-Gg: ASbGncta0Ju46y0z5RwoYbIuGowSd3WmGwTC6ls3MAuIvK03eghe73ZEXAgoXPsxpDz
	lssIErsRjLOupYk5acJg5uyOZow0B4447HqbOq9bHpbHfk/MOf69bL6b+haHOFa2onkCztIz1UR
	F5iz/6qTITXPYd3RkA9FxkiZUDbTfgi222zG1Cs8GZoQs55tQVWcqAiryJqtkawufeMBVS9YY8a
	oNRUFkUEdSr/C00vS9UigBfxQfl4hOZRh8nA8efvl/qQki/zDtxW/FeJZJHFyKdHaWPcNvY+Us2
	c9VmyaPrHnZIukrKXhyKF0UcELmuOojutzMBJ9UCRlNjsRkKG6MKIv+DJCDZOJlcXPWeNTzillE
	pAqzKxxBrBzjT1q8QBCud7m58CeYb
X-Google-Smtp-Source: AGHT+IEV8S1X8yUwn1TTPkXG5qP4Bhfx85uEoPDrLTHDaoendE33Txor0jBwuEWUxTavEgFkYn30yg==
X-Received: by 2002:a05:600c:489a:b0:45d:dc9b:e85f with SMTP id 5b1f17b1804b1-46e329aedecmr1389115e9.2.1758726301251;
        Wed, 24 Sep 2025 08:05:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e2a9bd9c3sm36164615e9.9.2025.09.24.08.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:05:00 -0700 (PDT)
Date: Wed, 24 Sep 2025 18:04:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/6] firewire: core; eliminate pick_me goto label
Message-ID: <202509242259.ICWpLRW0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250918230857.127400-6-o-takashi@sakamocchi.jp>

Hi Takashi,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Takashi-Sakamoto/firewire-core-remove-useless-generation-check/20250919-115832
base:   e6d2338b6f3e522872f3a14fcc5e5de2f58bf23b
patch link:    https://lore.kernel.org/r/20250918230857.127400-6-o-takashi%40sakamocchi.jp
patch subject: [PATCH 5/6] firewire: core; eliminate pick_me goto label
config: sparc64-randconfig-r072-20250922 (https://download.01.org/0day-ci/archive/20250924/202509242259.ICWpLRW0-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509242259.ICWpLRW0-lkp@intel.com/

New smatch warnings:
drivers/firewire/core-card.c:445 bm_work() error: uninitialized symbol 'stand_for_root'.

vim +/stand_for_root +445 drivers/firewire/core-card.c

e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  381  static void bm_work(struct work_struct *work)
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  382  {
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  383  	static const char gap_count_table[] = {
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  384  		63, 5, 7, 8, 10, 13, 16, 18, 21, 24, 26, 29, 32, 35, 37, 40
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  385  	};
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  386  	struct fw_card *card __free(card_unref) = from_work(card, work, bm_work.work);
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  387  	struct fw_node *root_node __free(node_unref) = NULL;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  388  	int root_id, new_root_id, irm_id, local_id;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  389  	int expected_gap_count, generation;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  390  	bool do_reset = false;
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  391  	bool stand_for_root;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  392  
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  393  	if (card->local_node == NULL)
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  394  		return;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  395  
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  396  	generation = card->generation;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  397  
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  398  	root_node = fw_node_get(card->root_node);
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  399  
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  400  	root_id  = root_node->node_id;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  401  	irm_id   = card->irm_node->node_id;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  402  	local_id = card->local_node->node_id;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  403  
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  404  	if (card->bm_generation != generation) {
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  405  		enum bm_contention_outcome result = contend_for_bm(card);
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  406  
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  407  		switch (result) {
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  408  		case BM_CONTENTION_OUTCOME_WITHIN_WINDOW:
379b870c28c6a6 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-15  409  			fw_schedule_bm_work(card, msecs_to_jiffies(125));
25feb1a96e21ae drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  410  			return;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  411  		case BM_CONTENTION_OUTCOME_IRM_HAS_LINK_OFF:
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  412  			stand_for_root = true;
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  413  			break;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  414  		case BM_CONTENTION_OUTCOME_IRM_COMPLIES_1394_1995_ONLY:
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  415  			stand_for_root = true;
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  416  			break;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  417  		case BM_CONTENTION_OUTCOME_AT_NEW_GENERATION:
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  418  			// BM work has been rescheduled.
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  419  			return;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  420  		case BM_CONTENTION_OUTCOME_LOCAL_PROBLEM_AT_TRANSACTION:
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  421  			// Let's try again later and hope that the local problem has gone away by
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  422  			// then.
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  423  			fw_schedule_bm_work(card, msecs_to_jiffies(125));
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  424  			return;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  425  		case BM_CONTENTION_OUTCOME_IRM_IS_NOT_CAPABLE_FOR_IRM:
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  426  			// Let's do a bus reset and pick the local node as root, and thus, IRM.
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  427  			stand_for_root = true;
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  428  			break;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  429  		case BM_CONTENTION_OUTCOME_IRM_HOLDS_ANOTHER_NODE_AS_BM:
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  430  			if (local_id == irm_id) {
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  431  				// Only acts as IRM.
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  432  				allocate_broadcast_channel(card, generation);
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  433  			}
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  434  			fallthrough;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  435  		case BM_CONTENTION_OUTCOME_IRM_HOLDS_LOCAL_NODE_AS_BM:
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  436  		default:
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  437  			card->bm_generation = generation;
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  438  			stand_for_root = false;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  439  			break;
931c4834c8d1e1 drivers/firewire/fw-card.c   Kristian Høgsberg 2007-01-26  440  		}
ff94548bbb2edf drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  441  	}

stand_for_root is uninitialized on the else path.

931c4834c8d1e1 drivers/firewire/fw-card.c   Kristian Høgsberg 2007-01-26  442  
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  443  	// We're bus manager for this generation, so next step is to make sure we have an active
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  444  	// cycle master and do gap count optimization.
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19 @445  	if (!stand_for_root) {
                                                                                    ^^^^^^^^^^^^^^^

91bf158f8cdf6f drivers/firewire/core-card.c Takashi Sakamoto  2025-09-13  446  		if (card->gap_count == GAP_COUNT_MISMATCHED) {
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  447  			// If self IDs have inconsistent gap counts, do a
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  448  			// bus reset ASAP. The config rom read might never
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  449  			// complete, so don't wait for it. However, still
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  450  			// send a PHY configuration packet prior to the
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  451  			// bus reset. The PHY configuration packet might

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

