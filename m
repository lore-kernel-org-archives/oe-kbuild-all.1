Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CE822F15
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 17:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695057121; x=1726593121;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=bhsO3UK/tiC8VZSa32uhHY21Knn6aajSceTjYxVjDPs=;
  b=d8GOSw/M811ENZuy5hNKqG2ieEBIUpZH6wKdYJQ5tFehysjeDnpl7zc5
   rsN7bRASs80XTn7PzU/A5QVmTapIY2HLXXCeE3Ih0zAJRu46f+7wugvpY
   C+AsO3D24EWTXiXKnl1fgFcDN1Y7O7ma/bqoRAFz4Q9QAhh9b+vC9oXgk
   8EW+8UqMdYCsppwrkvxVp6CDbmDb4k4P/MOkMNdiaRpIb9+Ki1jgbf4Bw
   /ralxPIRuLirXpvyyI/h60nKgF4XfbZxov+lNoXzYqwzq9rhFUTQOrASa
   940fkGC2oLX1VvZKZAC/4zBdZfBxL0rc70seZSd2zFK5A4vcUTRSAh1hw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377038075"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="377038075"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 10:12:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="775204993"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="775204993"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 18 Sep 2023 10:11:59 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiHmu-0006JU-2e;
	Mon, 18 Sep 2023 17:11:56 +0000
Date: Tue, 19 Sep 2023 01:11:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jade Lovelace <lists@jade.fyi>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] Revert "misc: rtsx: judge ASPM Mode to set PETXCFG Reg"
Message-ID: <ZQiEsy+j14XWevqZ@6fe19fc45f19>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918170831.1677690-3-lists@jade.fyi>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html/#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] Revert "misc: rtsx: judge ASPM Mode to set PETXCFG Reg"
Link: https://lore.kernel.org/stable/20230918170831.1677690-3-lists%40jade.fyi

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



