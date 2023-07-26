Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050561AA60
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 17:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690393819; x=1721929819;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=g/pOf/x2n5QOVcoOhpu3qVIn7iXK2aHYEq2SSib4X9Y=;
  b=Iyst/MeNqojpCtUpY49kPf8MpcozRclKDjbLhmpyxFf1vmRB5nsm0aL9
   5DA8hjBhY08zqFmqWIC+VxaTRc656+/KlxGHz2tfITNtTFCOYs53tlCae
   JPZwhLuOGqw2E4gjrsBcr/kYcSOo3R9lZyleaR4ZZfrTEwLYtYVXAwCKv
   vcUECcVBo+9JQDoLvk5McYHbRqFwasE3MoUITxLw3ModFNpgFpf6m1GRK
   Qaqad93Zp549PiJocRxMdidMekfAkmvyf/pRGLcBUKNQAaYmPOpDLl/lL
   FM4uIzl/9NsWmStKxwlizBBUUd8RkrLsAAmU6LcUzduVpWdbdt2Wcvtn0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="358087016"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="358087016"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 10:50:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="796670839"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="796670839"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 26 Jul 2023 10:50:18 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOieP-0001A0-1Z;
	Wed, 26 Jul 2023 17:50:17 +0000
Date: Thu, 27 Jul 2023 01:49:59 +0800
From: kernel test robot <lkp@intel.com>
To: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] riscv: Handle zicsr/zifencei issue between gcc and
 binutils
Message-ID: <ZMFcx/wHKG+Lbjnt@c507f7d2ae6a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726174524.340952-1-xingmingzheng@iscas.ac.cn>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v2] riscv: Handle zicsr/zifencei issue between gcc and binutils
Link: https://lore.kernel.org/stable/20230726174524.340952-1-xingmingzheng%40iscas.ac.cn

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



