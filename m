Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCDF7C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 11:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674474610; x=1706010610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=up4w9zbb43XdXWG+36x0EW9amqocH5GpAHlVrZaV0vU=;
  b=IoOVgaAOniWGPPxihoKlqObTyME6nFm4EpGEeR362m2o9+oZ3zBeNU6x
   1JO+vFjI0QY2Oxqxk8RjuV3tscunurklTu23wl6oPR7Mt9F1VLWqVeAmd
   iCcjTqVhQOwowbQ9rRiY1B46RqBFRE5uyYNul4SoNzDeKzZoyKwRSbvbW
   MUKWwPDj88bFaNNJqtk4+YMXkfmqKG11dcgR3qu9ymXqOt0RVR2y8/o65
   aejBpkvsMeGyoz4B4DXV4KlFfowZMrTf+proe86kJuy6+xTAaCvfmBw7e
   xzzs0WdFJuA+47GzgMGh9OKIaffBpht3XySNobd/6c13vlhIop97Hc1tE
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="323714026"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="323714026"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 03:50:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="804072057"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="804072057"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Jan 2023 03:50:05 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJvKv-0005c4-0i;
	Mon, 23 Jan 2023 11:50:05 +0000
Date: Mon, 23 Jan 2023 19:49:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ajay Kaher <akaher@vmware.com>, rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, chinglinyu@google.com,
	namit@vmware.com, srivatsab@vmware.com, srivatsa@csail.mit.edu,
	amakhalov@vmware.com, vsirnapalli@vmware.com, tkundu@vmware.com,
	er.ajay.kaher@gmail.com, Ajay Kaher <akaher@vmware.com>
Subject: Re: [PATCH 6/8] eventfs: adding eventfs lookup, read, open functions
Message-ID: <202301231952.hO83QgH2-lkp@intel.com>
References: <1674407228-49109-6-git-send-email-akaher@vmware.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1674407228-49109-6-git-send-email-akaher@vmware.com>

Hi Ajay,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.2-rc5 next-20230123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ajay-Kaher/eventfs-adding-eventfs-dir-add-functions/20230123-010956
patch link:    https://lore.kernel.org/r/1674407228-49109-6-git-send-email-akaher%40vmware.com
patch subject: [PATCH 6/8] eventfs: adding eventfs lookup, read, open functions
config: x86_64-randconfig-s022 (https://download.01.org/0day-ci/archive/20230123/202301231952.hO83QgH2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/bdfb24dc39f183eda75dc7c6ad54798181ad4a94
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ajay-Kaher/eventfs-adding-eventfs-dir-add-functions/20230123-010956
        git checkout bdfb24dc39f183eda75dc7c6ad54798181ad4a94
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/tracefs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   fs/tracefs/event_inode.c:48:15: sparse: sparse: symbol 'eventfs_create_file' was not declared. Should it be static?
   fs/tracefs/event_inode.c:117:15: sparse: sparse: symbol 'eventfs_create_dir' was not declared. Should it be static?
>> fs/tracefs/event_inode.c:192:6: sparse: sparse: symbol 'eventfs_post_create_dir' was not declared. Should it be static?
>> fs/tracefs/event_inode.c:291:5: sparse: sparse: symbol 'dcache_dir_open_wrapper' was not declared. Should it be static?
   fs/tracefs/event_inode.c:340:31: sparse: sparse: symbol 'eventfs_root_dir_inode_operations' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
