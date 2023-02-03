Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B7F7C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 02:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675391355; x=1706927355;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=LFGaYiaHj6BLsqHIUvjl+hA1tTwv/Wrimi83oTKsy7k=;
  b=VLeRtiF1Us/JzzmZDYiKZAnOPvxgrlAlJjbLK4nToBosLPmd5f90MAzi
   tCwXByLYgpk9Oadq6dh5CAYZ2g9gXxFXuJNKJ2dfw5yMT90Q6MRicayAC
   of+7RHP+O7C2MHJTCORvmWafiqgwcvKR9SAHe7OyYDuy+tsTakGsHN4kz
   sGRKzD3apuHv2BT3dzk/RvUOjXJMoqA4opEwmyH8zlCrUoD8y1BO8IFLi
   nEtVABKUfPkuEX39S5uCYAbAeReegAGHpGB15rX+CkrrULl2wOUD3DHVk
   CWiP7ay7Qd8XF6unFjKxkhyTavO7uWP7UXim8sWqqULW1X2fodn0A5CzL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="312289805"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; 
   d="scan'208";a="312289805"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 18:29:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="839432827"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; 
   d="scan'208";a="839432827"
Received: from lkp-server01.sh.intel.com (HELO 0572c01a5cf9) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 02 Feb 2023 18:29:13 -0800
Received: from kbuild by 0572c01a5cf9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNlpA-000029-2P;
	Fri, 03 Feb 2023 02:29:12 +0000
Date: Fri, 3 Feb 2023 10:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: Zheng Wang <zyytlz.wz@163.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] bcache: Remove some unnecessary NULL point check for the
 return value of __bch_btree_node_alloc-related pointer
Message-ID: <Y9xxRgsa3ZLVKR1x@904499574ff1>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203022759.576832-1-zyytlz.wz@163.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] bcache: Remove some unnecessary NULL point check for the return value of __bch_btree_node_alloc-related pointer
Link: https://lore.kernel.org/stable/20230203022759.576832-1-zyytlz.wz%40163.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



