Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAD37F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 09:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675503522; x=1707039522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xiZgZsJuCpjgiD0NAzlWJRA/pLfimPXAWyzZBVVrg9s=;
  b=D4V3mCCax/Y9XuaBd04wi8qFTu1DMJQ8rJRMw3KriJI9YJE7/MLlk/T3
   laMr1BViaFpfTkT3koUJxSc3rNwtVnFWw3IUgmQSGx/U/rxwV7icwe3g7
   uSa/o56TtGeb8kfJ/guIexMZxZOkrRN5wT2hGVc0u50tdxt/+qIcrEh1V
   62auagJsRccoiVAiDK+hpveGKTxHNnqV0qcNNcaO2mDwPcOn+EHzLZDq/
   9mMvQW1rKP8+YO59uLVKZXsvYkbgFw3dbx+oOuNS8dRw+4CV334nK2NGG
   +kRSMadK0uBMpkqVYcPwfc03AGq7JHMa0zEoQBBo6oZA1D2an9zvkEe71
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="309266345"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="309266345"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 01:38:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="659366483"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="659366483"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Feb 2023 01:38:39 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOF0I-0001Ce-2S;
	Sat, 04 Feb 2023 09:38:38 +0000
Date: Sat, 4 Feb 2023 17:38:01 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Courbot <acourbot@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
	linux-doc@vger.kernel.org
Subject: [jsarha:topic/cros-sof-v4.19 1264/6555] spdxcheck:
 Documentation/media/uapi/mediactl/media-ioc-request-alloc.rst: 1:39 Invalid
 License ID: GFDL-1.1-or-later
Message-ID: <202302041705.9KpNOrLD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: fafd43c288ef4de7f385fde1dd59e45aec303d45 [1264/6555] UPSTREAM: media: Documentation: v4l: document request API
reproduce:
        scripts/spdxcheck.py

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

spdxcheck warnings: (new ones prefixed by >>)
   include/dt-bindings/reset/amlogic,meson-axg-reset.h: 9:41 Invalid License ID: BSD
>> Documentation/media/uapi/mediactl/media-ioc-request-alloc.rst: 1:39 Invalid License ID: GFDL-1.1-or-later
>> Documentation/media/uapi/mediactl/media-request-ioc-queue.rst: 1:39 Invalid License ID: GFDL-1.1-or-later
>> Documentation/media/uapi/mediactl/media-request-ioc-reinit.rst: 1:39 Invalid License ID: GFDL-1.1-or-later
>> Documentation/media/uapi/mediactl/request-api.rst: 1:39 Invalid License ID: GFDL-1.1-or-later
>> Documentation/media/uapi/mediactl/request-func-close.rst: 1:39 Invalid License ID: GFDL-1.1-or-later
>> Documentation/media/uapi/mediactl/request-func-ioctl.rst: 1:39 Invalid License ID: GFDL-1.1-or-later
>> Documentation/media/uapi/mediactl/request-func-poll.rst: 1:39 Invalid License ID: GFDL-1.1-or-later

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
