Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3864010F2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 May 2023 17:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683393503; x=1714929503;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=HnVE3xiw/NBQ6aMBPon8O7ZNvHJfXRrRdt75Fc09ZfI=;
  b=UxANHxuHTn3eOsjkvk14661F9o2G7cIEqH4vZbdGbPBnQFZszSyHVSML
   MZ0hc9anS3wJR2jR0Vb+xqbcURePee0kJpKmel63awhi1t7IktNh8cCCh
   smuYQnEY2YDZClMEwdeN9v6yBAFH6BF7+1EEbcRPCAJCyU518loj56IU5
   lZqn4j/R4w7vt3xkbaratBWEnjw6LlC2UUA6WQcGx1gzMV9qLlOsB+EKK
   lz1ZOTHXFjVSrsEMPXMP940FOiYR3dCauR7gKUMuQIaP8NxrbTsaxMB6s
   v3G3tC6v52qDGhDszCAYS39DlsSn/UonOKEeM7tcq9I3UUGs8cEXU04Ty
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="349434270"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="349434270"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 10:18:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="762867875"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="762867875"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 May 2023 10:18:21 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvLY4-0000Pu-39;
	Sat, 06 May 2023 17:18:20 +0000
Date: Sun, 7 May 2023 01:17:44 +0800
From: kernel test robot <lkp@intel.com>
To: frshuov@163.com
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for ASUS GU603ZM
Message-ID: <ZFaLuB2ztV6EJ1I8@e0f96cf4e6cd>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230506171546.50815-1-frshuov@163.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] ALSA: hda/realtek: Add quirk for ASUS GU603ZM
Link: https://lore.kernel.org/stable/20230506171546.50815-1-frshuov%40163.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



