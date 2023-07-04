Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2277979CC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 20:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688501350; x=1720037350;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=NNmJNtnF9pCiStFXF9MVPbEuQxx66cX165aM1uTNkV4=;
  b=Hg2D3I4OCeSHUGwWw/pYLyg9nC8Y9xT6N7BM/LQsZvQIOFywHZzOgeoV
   tQkOOnUYVrxn5u8LGY7NEspRFOvmHLuNHms+qFB5c+EMSBsljgSTq5VBT
   guX1jTn3AonpBXbaAV8yz963Waa2k2QyndJI+WUqpAWqeJN8setQvFd70
   6hLGmqY/R2RceUeWG5ksF7YlYw/0IRyN9IzJvg7SalVEYItbd/KVZ6mVN
   R68t/oFM+gYrZjFeqHsqk3CNL+1b9vz1OrJc+PjD4UGtQWmqMcMg3VvDq
   3ZVtw1A//p1v5azZmfmIoS/iCSLfx/zUgldpqzAcQVPCV6VGtypvh8rfm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="363221756"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="363221756"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 13:09:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="1049480631"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="1049480631"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Jul 2023 13:09:07 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGmKg-000IWB-1U;
	Tue, 04 Jul 2023 20:09:06 +0000
Date: Wed, 5 Jul 2023 04:08:30 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/1] fork: lock VMAs of the parent process when forking
Message-ID: <ZKR8PtubX/atawm0@65525e8f8615>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704200656.2526715-1-surenb@google.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 1/1] fork: lock VMAs of the parent process when forking
Link: https://lore.kernel.org/stable/20230704200656.2526715-1-surenb%40google.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



