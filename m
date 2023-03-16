Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A63520EE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 07:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678951891; x=1710487891;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bRuPOGfZnu4JByDAsSat1lIPi/d4YuYFnKKqk6RPkbs=;
  b=IC2j0qVjDCFgSe7EkFVxRoN2QL8GGuqn7r6aFrlvPz7gey2+CVhUSWED
   voPgM3d8Lank+Jb+LAJLeaPzLiSjxID6ssUvUIF6OO78dNtJjMTY92Doo
   iaOPWgxwgCtH/o8LjddX/wOVlmh5wQHoIB13k0BSmvlXk/bog0Xz7fKV4
   GWMbvXvV8nb3Wy8ASvU8tYoNXtdN6drluvheZ0Oo7innDlB65bRKY5XTp
   uKthTQYrzmCyePee13ObhQCkUzQScQH4uxcrjEk22BndyGumu043qGSh5
   /S9Gf4gSr2r3O9/RDkh3gsIWEi38mKMiqXKNRAlCCDK41WVWlp0YcVkL/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="336606557"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="336606557"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 00:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="679794068"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="679794068"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 16 Mar 2023 00:31:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pci56-0008PO-2a;
	Thu, 16 Mar 2023 07:31:24 +0000
Date: Thu, 16 Mar 2023 15:30:31 +0800
From: kernel test robot <lkp@intel.com>
To: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Derek Kiernan <derek.kiernan@xilinx.com>,
	Dragan Cvetic <dragan.cvetic@xilinx.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 3/7] Documentation: sysfs: Document the Lantiq PEF2256
 sysfs entry
Message-ID: <202303161547.ZzSQWnIQ-lkp@intel.com>
References: <167888779364.26.9200222608363841485@mailman-core.alsa-project.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <167888779364.26.9200222608363841485@mailman-core.alsa-project.org>

Hi Herve,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on robh/for-next char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.3-rc2 next-20230316]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina-via-Alsa-devel/drivers-misc-Add-support-for-the-Lantiq-PEF2256-framer/20230315-214833
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/167888779364.26.9200222608363841485%40mailman-core.alsa-project.org
patch subject: [PATCH 3/7] Documentation: sysfs: Document the Lantiq PEF2256 sysfs entry
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/0140596e508d18933cd319314838bc802214b345
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Herve-Codina-via-Alsa-devel/drivers-misc-Add-support-for-the-Lantiq-PEF2256-framer/20230315-214833
        git checkout 0140596e508d18933cd319314838bc802214b345
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303161547.ZzSQWnIQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/ABI/testing/sysfs-bus-platform-devices-pef2256:2: WARNING: Unexpected indentation.
>> Documentation/ABI/testing/sysfs-bus-platform-devices-pef2256:2: WARNING: Block quote ends without a blank line; unexpected unindent.

vim +2 Documentation/ABI/testing/sysfs-bus-platform-devices-pef2256

   > 2	KernelVersion:	6.4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
