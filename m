Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB7117EE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 19:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690398847; x=1721934847;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=0Zos+9257AHvhuMFGmdTmn1FriMWxOr1r7wksKzT3h8=;
  b=EoO5VtudQ8kM0zkozkILz9F05jvbvlqO3T1KntdLrdFfRr9HnAxpL6Hp
   aU41wnKWGVXOmev/+O/KxiwPXeDtwIcHSEWSqgRoqOnpSZv2zqH8zV6CX
   t2dsopWgONktFN1tCqI9L5jY5GBMEnhuwYOAFnJKKPqIUYtTDkpuSd5B5
   /ivaI38mz0YjDvISThrAq1SywU/FAQmqc97Pzz73BHYBI0PwTtikESHxc
   buZQjyeZtcxMbT9iYoWZ2byh2nCuYA27QAH7KpwstpOLE0BXAuO6sPMiS
   /o0cR7aqMO+vjh10++U8yR8Y38MJg3+d6VhM2wfrTN/JWBrHpuzfgM7nM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="358107441"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="358107441"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 12:14:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="761778740"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="761778740"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 26 Jul 2023 12:14:06 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOjxV-0001E3-10;
	Wed, 26 Jul 2023 19:14:05 +0000
Date: Thu, 27 Jul 2023 03:13:38 +0800
From: kernel test robot <lkp@intel.com>
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] virtio-vdpa: Fix cpumask memory leak in
 virtio_vdpa_find_vqs()
Message-ID: <ZMFwYn54cWWGIYvo@c507f7d2ae6a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726191036.14324-1-dtatulea@nvidia.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] virtio-vdpa: Fix cpumask memory leak in virtio_vdpa_find_vqs()
Link: https://lore.kernel.org/stable/20230726191036.14324-1-dtatulea%40nvidia.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



