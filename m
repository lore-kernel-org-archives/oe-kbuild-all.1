Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D0E23A6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 12:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675082405; x=1706618405;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=O10DwT3knlxYoTJUFWvltC0ZkL/SrOQ4uIPyFDdngjQ=;
  b=aNaT4uQKQYdtB2uKqlj3auBRoIlM/spWH/lqzXZM4u0YRlTvjsAI4BDY
   hbUlPZpmX4aaikZUWEfllcq1Gf6ljwO/GTCzVaLeP6ESzUCePEQfzyY2c
   IEwcbExUE2yil8XN4NHhumz0s+W4mqgFGSuMG0e8sM4iqBfi2S4NMyspC
   cHZd8T0bNNVY72eEI84Ra5tyOagPd6axmn5eKRkD4gEb/l8EUOFrOFa71
   R49AiGvuPZKZP221Lawf2CWKFi9ivwqOzbsCw9A3ZX47UzZEtDKmaC3r2
   OHhPJrfw789EtZP+Uwif0M6Q5vlitQzLHlaFsi94aFcz1WmxY2i/BMHg/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="354860105"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="354860105"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 04:40:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="772486334"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="772486334"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 30 Jan 2023 04:40:03 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMTS6-0003cg-0I;
	Mon, 30 Jan 2023 12:40:02 +0000
Date: Mon, 30 Jan 2023 20:39:18 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.10 1/1] mt76: fix mt7615_init_tx_queues() return value
Message-ID: <Y9e6dixwiXvo4l/U@904499574ff1>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130123655.86339-2-n.zhandarovich@fintech.ru>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 5.10 1/1] mt76: fix mt7615_init_tx_queues() return value
Link: https://lore.kernel.org/stable/20230130123655.86339-2-n.zhandarovich%40fintech.ru

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



