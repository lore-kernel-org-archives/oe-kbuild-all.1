Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A464322E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 07:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688715116; x=1720251116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dMYoS7OYO3G/+Ne6hbRfRZ61pCxxQO9DPHjwzlcVR7g=;
  b=muLNldq15PSh6pG9Tm7+acV1uZtQnTL5nZq0h1LUtR+2nFMzwdzGPgPe
   ttOfAoxYakW+yL4LEP4/CfkfoeU0QilL6Sw05Sh8vD2AvUOgXVjDCFH33
   3voXUKLDX6jyzM0YAefNGqV+rECUDsWaDs8t7yE2gM13Ui3rnwYYVYC50
   gMwJYu9UX+/eO7pXJLwEhPzcm3x6QsANDFkoxrXZvssjSnYY7uF6eXVvm
   3gzGcxyvyAxb1kQXyBIAAFzT8+GVLgE+ZTgwCcXK+xNbG51l9gLh0vf+3
   RzUOLCVFxTY8O6KxnrIoIZ2RL/mROiE3R94UHgEBWczo+vBioAOxtp5/C
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="429891095"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="429891095"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 00:31:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="697129129"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="697129129"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Jul 2023 00:31:54 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHfwX-0001rk-1k;
	Fri, 07 Jul 2023 07:31:53 +0000
Date: Fri, 7 Jul 2023 15:31:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 166/224] ERROR: Input tree has errors,
 aborting (use -f to force output)
Message-ID: <202307071518.yHSl1T0a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   f0a133b849634b4a3052fb456a980bf89a08f154
commit: b77d65a4dd27e9c2246737b264a73f78f5ec28a9 [166/224] arm64: dts: qcom: sdm845: Flush RSC sleep & wake votes
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230707/202307071518.yHSl1T0a-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307071518.yHSl1T0a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307071518.yHSl1T0a-lkp@intel.com/

All errors (new ones prefixed by >>):

   also defined at arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:210.11-507.3
>> ERROR: Input tree has errors, aborting (use -f to force output)
--
   also defined at arch/arm64/boot/dts/qcom/sdm845-db845c.dts:250.11-389.3
>> ERROR: Input tree has errors, aborting (use -f to force output)
--
   also defined at arch/arm64/boot/dts/qcom/sdm845-mtp.dts:56.11-350.3
>> ERROR: Input tree has errors, aborting (use -f to force output)
--
   also defined at arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts:125.11-196.3
>> ERROR: Input tree has errors, aborting (use -f to force output)
--
   also defined at arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts:31.11-233.3
>> ERROR: Input tree has errors, aborting (use -f to force output)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
