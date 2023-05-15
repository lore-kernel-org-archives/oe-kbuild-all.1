Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26433846E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 May 2023 18:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684176513; x=1715712513;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=WUb2X5IL4vCaMDplSvo43ilMU6qy7fovku+vqYS6oCY=;
  b=KhmVO/IH7y4U0etn8RNTD6uo+zbZu5+uIhxAcvcDbicymBOgbCd3iatv
   p4cQkKLpXsLzC3P2J0iivNIH0qSXgOBD13U1DZmMcLc8v+DnelG5qTarD
   YKVGZbby25A9mt194q2WGmiH1dZzSTTY/tOGrHPX9ApTUZgMHJk8Z+oKx
   fXPBmjzJDvdM39Eb2xZak7VckR5uRQEo6ME5qysPw2AkX4SiKTZE5MFtQ
   Z1bfa/Hk//35ee6nEFd+QC+GxGGHe/0gts8P4puZTe/MbzAGZmWS0Ec+t
   MZIROx1Ln2GixekEzlLTWZqBpFxU+ZGPmOG9dtmbvdgh3yeqt+UICLA/b
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="348779576"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="348779576"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 11:48:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="695132393"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="695132393"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 15 May 2023 11:48:31 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pydFG-0006Yk-1y;
	Mon, 15 May 2023 18:48:30 +0000
Date: Tue, 16 May 2023 02:47:48 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Kelley <mikelley@microsoft.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/1] scsi: storvsc: Don't pass unused PFNs to Hyper-V host
Message-ID: <ZGJ+VOyjHUf7DvxB@e0f96cf4e6cd>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1684171241-16209-1-git-send-email-mikelley@microsoft.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 1/1] scsi: storvsc: Don't pass unused PFNs to Hyper-V host
Link: https://lore.kernel.org/stable/1684171241-16209-1-git-send-email-mikelley%40microsoft.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



