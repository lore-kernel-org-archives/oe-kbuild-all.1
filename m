Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23195290A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Nov 2022 20:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668718514; x=1700254514;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=rDu+aQsStATdBBjnXPADjtc+xwJugK85m3JMNUEHqY8=;
  b=AXmyq5XNzl4ihM5hOvrZtxGthgi+7XXvrQ+GQ6hdB3S9WcEkiwzSjTYX
   HYK+L+Djl+qdFPoUpbw7QgPaG47v1wXO49aZSvq6Ni0rFCD9xD/YRnc/K
   aLrjcu2Mvo4HmUaSjFd6r7AnNw3Bd33fg0nEvXC7SIue3/08eIolWEaD0
   u+6lYUMQ81ZW7AfKxeBmm3c7m2plmdvh+nsX2KK0yxilPFZ8tod/eAztu
   NHeyrW1MJ0hOJQzqd+LNba2goQyeAC4h8E5PMDmY1j/2zp8pi7RiEr9yl
   VUU9CbWsjpfNh5ADYuMvFFrfxewQS54p9rBe9kiCfQgqUZtwSiUeOjL3x
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="310605508"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; 
   d="scan'208";a="310605508"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 12:55:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="728975937"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; 
   d="scan'208";a="728975937"
Received: from lkp-server01.sh.intel.com (HELO 55744f5052f8) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Nov 2022 12:55:12 -0800
Received: from kbuild by 55744f5052f8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ovluh-0000dL-31;
	Thu, 17 Nov 2022 20:55:11 +0000
Date: Fri, 18 Nov 2022 04:54:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ferry Toth <ftoth@exalondelft.nl>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/2] usb: dwc3: core: defer probe on ulpi_read_id
 timeout
Message-ID: <Y3afn82u6x4RpPZs@916a7fd48d89>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117205411.11489-3-ftoth@exalondelft.nl>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v3 2/2] usb: dwc3: core: defer probe on ulpi_read_id timeout
Link: https://lore.kernel.org/stable/20221117205411.11489-3-ftoth%40exalondelft.nl

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp



