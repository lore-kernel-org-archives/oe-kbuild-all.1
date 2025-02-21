Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BB017CA17
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 23:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740180289; cv=none; b=Zt3ZkNAjEeLuAM+sCD0CY8LLZDtgYi+pw7GnslQ5yi4Gjn86Wkh7v8y788YJo4Sj8U0QJNCvUZb0ytOIeuzeUiOKjo1WuCtzQBiuGEr+A84cJ6iEIoqaOb98xvArJ9YWmw3eMgvhHfDl6cOchiMqis/y4i7uW46O5z1LeVurgA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740180289; c=relaxed/simple;
	bh=umi+s7G7Zc/UkflnjE+u6ayqRWyPKaEj3Zl86+lNrI4=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lv/yuDCZtY4xzsucJ8jfWRlm0frWTb/ZrNgSKF6AaWGjHUzWH0MPkGWU8QMLVQ4p4SufCbTsqb/YC+1C9rTu6FK8PCoi6sBLfLedg5j+jpFZ7GW5bNBAmKG0i8dqDp01oWtIlrWN7JCm6dMnWSNQm/fuy8ppJURnLut/gPvmsu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cc/2mXG/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cc/2mXG/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740180287; x=1771716287;
  h=date:from:cc:subject:message-id:mime-version;
  bh=umi+s7G7Zc/UkflnjE+u6ayqRWyPKaEj3Zl86+lNrI4=;
  b=Cc/2mXG/Yfwi/icGwi/da6ip8uJV/sDvTXZ4smU4Fpzc0hASL0//TXQt
   WM6wOZVsi5Xjs4GV/2MzPjQDL9hKtWK+JYK7OjJJq3meIiiKZQPx/tiUL
   N5UienHJHVI0MgKH/lKO9JZa3LQCMy5i9hXLqrWt8/jkU58qPg1OVjpFX
   VIDs3YccvrkAIqgo6/vYUsgsGQcLttPxrEOfaBwkhFMqFjJonMEFXKinC
   J3+ZdkBMbpttJOO4h/LhnTiyGKLnyJsaUw4I7fzWUUnGs7I4qPGunXOWB
   0dnedDCt5Yrw/9eWo48iTk5cIBOkSRo/KHre3Nc8xzOAzE46StzksaMCx
   g==;
X-CSE-ConnectionGUID: lyUTAZ9ZRHq44GcKTSG2Lw==
X-CSE-MsgGUID: DDuTBikbQJWp0mwAordoEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40860288"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; 
   d="scan'208";a="40860288"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 15:24:46 -0800
X-CSE-ConnectionGUID: MowSXhFrR56ftLkX+wtC7A==
X-CSE-MsgGUID: BPAA8uxeQ0GDXzzc5nUbLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; 
   d="scan'208";a="146344218"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Feb 2025 15:24:46 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlcNv-00068p-1X
	for oe-kbuild-all@lists.linux.dev;
	Fri, 21 Feb 2025 23:24:43 +0000
Date: Sat, 22 Feb 2025 07:24:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/59 1/1] sound/soc/codecs/rt274.c:757:3: warning: this
 statement may fall through
Message-ID: <202502220711.Kw0xLGHz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: c7e79b2b2d2d7c13c6162ed8672357f4ad0fd8f5 [1/1] ASoC: rt274: add rt274 codec driver
config: xtensa-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250222/202502220711.Kw0xLGHz-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502220711.Kw0xLGHz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502220711.Kw0xLGHz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/rt274.c: In function 'rt274_set_dai_pll':
>> sound/soc/codecs/rt274.c:757:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
      dev_warn(codec->dev, "invalid pll source, use BCLK\n");
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/rt274.c:758:2: note: here
     case RT274_PLL2_S_BCLK:
     ^~~~
   sound/soc/codecs/rt274.c:784:4: warning: this statement may fall through [-Wimplicit-fallthrough=]
       dev_warn(codec->dev, "invalid freq_in, assume 4.8M\n");
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/rt274.c:785:3: note: here
      case 100:
      ^~~~
   At top level:
   sound/soc/codecs/rt274.c:1103:36: warning: 'rt274_acpi_match' defined but not used [-Wunused-const-variable=]
    static const struct acpi_device_id rt274_acpi_match[] = {
                                       ^~~~~~~~~~~~~~~~


vim +757 sound/soc/codecs/rt274.c

   744	
   745	static int rt274_set_dai_pll(struct snd_soc_dai *dai, int pll_id, int source,
   746				unsigned int freq_in, unsigned int freq_out)
   747	{
   748		struct snd_soc_codec *codec = dai->codec;
   749		struct rt274_priv *rt274 = snd_soc_codec_get_drvdata(codec);
   750	
   751		switch (source) {
   752		case RT274_PLL2_S_MCLK:
   753			snd_soc_update_bits(codec, RT274_PLL2_CTRL,
   754					RT274_PLL2_SRC_MASK, RT274_PLL2_SRC_MCLK);
   755			break;
   756		default:
 > 757			dev_warn(codec->dev, "invalid pll source, use BCLK\n");
   758		case RT274_PLL2_S_BCLK:
   759			snd_soc_update_bits(codec, RT274_PLL2_CTRL,
   760					RT274_PLL2_SRC_MASK, RT274_PLL2_SRC_BCLK);
   761			break;
   762		}
   763	
   764		if (source == RT274_PLL2_S_BCLK) {
   765			snd_soc_update_bits(codec, RT274_MCLK_CTRL,
   766					(0x3 << 12), (0x3 << 12));
   767			switch (rt274->fs) {
   768			case 50:
   769				snd_soc_write(codec, 0x7a, 0xaab6);
   770				snd_soc_write(codec, 0x7b, 0x0301);
   771				snd_soc_write(codec, 0x7c, 0x04fe);
   772				break;
   773			case 64:
   774				snd_soc_write(codec, 0x7a, 0xaa96);
   775				snd_soc_write(codec, 0x7b, 0x8003);
   776				snd_soc_write(codec, 0x7c, 0x081e);
   777				break;
   778			case 128:
   779				snd_soc_write(codec, 0x7a, 0xaa96);
   780				snd_soc_write(codec, 0x7b, 0x8003);
   781				snd_soc_write(codec, 0x7c, 0x080e);
   782				break;
   783			default:
   784				dev_warn(codec->dev, "invalid freq_in, assume 4.8M\n");
   785			case 100:
   786				snd_soc_write(codec, 0x7a, 0xaab6);
   787				snd_soc_write(codec, 0x7b, 0x0301);
   788				snd_soc_write(codec, 0x7c, 0x047e);
   789				break;
   790			}
   791		}
   792	
   793		return 0;
   794	}
   795	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
