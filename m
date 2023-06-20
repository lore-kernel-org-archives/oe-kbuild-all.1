Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8529E101D1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 15:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687275870; x=1718811870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZGADFVJXd8Du1pooes+jrLE2cK1+HAS0de7DtytrOFA=;
  b=lBzRpsXvQkzcPjOlkppyucMlcwNBZdjQOFptw4FLmutlK/ROCAcNBEwU
   1lIRRDH9Lq30Ri9Bc52DkYAGEmEXjIj2fah+ONXplTOQrWbj1uHCXLqEY
   /d8FunV7MGJ5G8ekHu8Yp8Dtwp3hmS4JBJhHb0k65FkZrzouPehy34OSV
   m2AGAFoWIqK4lmvDbXzx7DXhAlHZjyr1O7qh2O3DPVTM6X4tR6JeR1tzs
   I+bm3ZAPoB48yf6n7l28jdosOh81kkCt583v9vtYYPz2HMPaCPptcim4h
   UNxz+SNIn9yf2YPRc+KQKGaCRX3d0mUtdmliI6MLhuebec2HgqduBimf7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="389180229"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="389180229"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 08:44:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="743815729"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="743815729"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Jun 2023 08:44:24 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBdWq-00061Q-0L;
	Tue, 20 Jun 2023 15:44:24 +0000
Date: Tue, 20 Jun 2023 23:44:00 +0800
From: kernel test robot <lkp@intel.com>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/5] media: platform: visconti: Add Toshiba Visconti
 Video Input Interface driver
Message-ID: <202306202308.y7ERKbSP-lkp@intel.com>
References: <20230620031111.3776-3-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620031111.3776-3-yuji2.ishikawa@toshiba.co.jp>

Hi Yuji,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master sailus-media-tree/streams v6.4-rc7 next-20230620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuji-Ishikawa/dt-bindings-media-platform-visconti-Add-Toshiba-Visconti-Video-Input-Interface-bindings/20230620-120839
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230620031111.3776-3-yuji2.ishikawa%40toshiba.co.jp
patch subject: [PATCH v6 2/5] media: platform: visconti: Add Toshiba Visconti Video Input Interface driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230620/202306202308.y7ERKbSP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306202308.y7ERKbSP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306202308.y7ERKbSP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./usr/include/linux/visconti_viif.h:12,
                    from <command-line>:
>> usr/include/linux/videodev2.h:2464:41: error: field 'timestamp' has incomplete type
    2464 |         struct timespec                 timestamp;
         |                                         ^~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
