Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A8DBA4F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 19:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678216649; x=1709752649;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=c1QNheMEc+8ictDdrPPyd0g3rP2K3ib+CJ+USnee4pE=;
  b=Gz1loq6/t9OU6C32uySC1z9+3nBz//U72U/INoYmziDXUk9svlf/kxbS
   +kOiCV29VcjT8OFoPKvN52lzKrYco5d0h4+OWkmwY7n0zz60t6zXHEn9L
   vTUiHSHjGSxg2uH+ZRm6sZ53TKcqThFlFHjCLXiWkoTG+SfQATicSiZfb
   cBE4ResTO8w3p+DXVijqH2pte9KUyv9+T4LRp1VLJvN4A64T2KlM3zpM0
   hHicuMJteZJmNug9gIa/UgTmp8QP/txiFWQgPOOBscCZtPJUGSKJ7od4m
   Ud7sagI+ZtVPzGGlctQ2Yz2Yl1ProLmvV2U/c7KDLzbUQ4s0kb+XiXPCI
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="337469146"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="337469146"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 11:17:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="1006005190"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="1006005190"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Mar 2023 11:17:16 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZcoG-0001Xf-0E;
	Tue, 07 Mar 2023 19:17:16 +0000
Date: Wed, 8 Mar 2023 03:17:03 +0800
From: kernel test robot <lkp@intel.com>
To: Leah Rumancik <leah.rumancik@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.15 01/11] xfs: use setattr_copy to set vfs inode
 attributes
Message-ID: <ZAeNryzk82WHn1C2@0f0c699f4fc0>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307185922.125907-2-leah.rumancik@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 5.15 01/11] xfs: use setattr_copy to set vfs inode attributes
Link: https://lore.kernel.org/stable/20230307185922.125907-2-leah.rumancik%40gmail.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



