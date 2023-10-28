Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B9123A0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 12:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YcOnPsGL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698497484; x=1730033484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VDf3aj1o8FsD2qZCp1rgbQUNRr5ZyRRATqwyibqMw/0=;
  b=YcOnPsGLxB1BJCvgJOv7PjiSTjsCrfwqc5Q9zeTJxCvEsh1iJkokPmvM
   Bznrobv/CEoOIgmjecF6AzaiZi7p3agH1HOMtxmjRX/x6zAbU5j8A+igw
   rdDiQcK1nQLD30NKSWxgDldhmDjAiboEkw3uqU5Q3qI5GR7HsIHk5XwP4
   dysAcmLxYt/tU+oYKh6NRfz6kRmwyy+Ov6Fg2GIE80E4OXBuXu04jRclI
   LChFkcAGBfCjLENRHEsln0C3L6vCraG6ponQ0l2LvZebv1n3dThO337Vk
   Db0NPY4X5+t2aKwHgFemVoDERjaYyXQA5fm5XUZ46eZP20eey1M2DjWZv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="372950146"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="372950146"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 05:51:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="759852475"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="759852475"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 Oct 2023 05:51:23 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwime-000Bkt-1y;
	Sat, 28 Oct 2023 12:51:20 +0000
Date: Sat, 28 Oct 2023 20:50:29 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-6.7 236/325] sound/core/rawmidi.c:1169:
 warning: Function parameter or member 'ptr' not described in
 'snd_rawmidi_receive'
Message-ID: <202310282021.YJqx7cFa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.7
head:   c9ecd45768d19a28da1d81e19ab3663828a4fec1
commit: 5ec51b77b2e5bf25b74c31dbf1abe760af18eed5 [236/325] function casts
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20231028/202310282021.YJqx7cFa-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310282021.YJqx7cFa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310282021.YJqx7cFa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/core/rawmidi.c:1169: warning: Function parameter or member 'ptr' not described in 'snd_rawmidi_receive'
>> sound/core/rawmidi.c:1169: warning: Excess function parameter 'substream' description in 'snd_rawmidi_receive'
--
>> drivers/infiniband/ulp/srpt/ib_srpt.c:216: warning: Function parameter or member 'ptr' not described in 'srpt_qp_event'
>> drivers/infiniband/ulp/srpt/ib_srpt.c:216: warning: Excess function parameter 'ch' description in 'srpt_qp_event'
--
>> fs/ubifs/lprops.c:1018: warning: Function parameter or member 'data' not described in 'scan_check_cb'
>> fs/ubifs/lprops.c:1018: warning: Excess function parameter 'lst' description in 'scan_check_cb'


vim +1169 sound/core/rawmidi.c

08fdced60ca08e David Henningsson 2021-05-15  1157  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1158  /**
^1da177e4c3f41 Linus Torvalds    2005-04-16  1159   * snd_rawmidi_receive - receive the input data from the device
^1da177e4c3f41 Linus Torvalds    2005-04-16  1160   * @substream: the rawmidi substream
^1da177e4c3f41 Linus Torvalds    2005-04-16  1161   * @buffer: the buffer pointer
^1da177e4c3f41 Linus Torvalds    2005-04-16  1162   * @count: the data size to read
^1da177e4c3f41 Linus Torvalds    2005-04-16  1163   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  1164   * Reads the data from the internal buffer.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1165   *
eb7c06e8e9c93b Yacine Belkadi    2013-03-11  1166   * Return: The size of read data, or a negative error code on failure.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1167   */
5ec51b77b2e5bf Arnd Bergmann     2023-06-19  1168  int snd_rawmidi_receive(void *ptr, const void *buffer, int count)
^1da177e4c3f41 Linus Torvalds    2005-04-16 @1169  {
5ec51b77b2e5bf Arnd Bergmann     2023-06-19  1170  	struct snd_rawmidi_substream *substream = ptr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1171  	unsigned long flags;
08fdced60ca08e David Henningsson 2021-05-15  1172  	struct timespec64 ts64 = get_framing_tstamp(substream);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1173  	int result = 0, count1;
463a20fd3481de Takashi Iwai      2022-06-17  1174  	struct snd_rawmidi_runtime *runtime;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1175  
463a20fd3481de Takashi Iwai      2022-06-17  1176  	spin_lock_irqsave(&substream->lock, flags);
463a20fd3481de Takashi Iwai      2022-06-17  1177  	if (!substream->opened) {
463a20fd3481de Takashi Iwai      2022-06-17  1178  		result = -EBADFD;
463a20fd3481de Takashi Iwai      2022-06-17  1179  		goto unlock;
463a20fd3481de Takashi Iwai      2022-06-17  1180  	}
463a20fd3481de Takashi Iwai      2022-06-17  1181  	runtime = substream->runtime;
463a20fd3481de Takashi Iwai      2022-06-17  1182  	if (!runtime || !runtime->buffer) {
ca20d29275b909 Takashi Iwai      2014-02-04  1183  		rmidi_dbg(substream->rmidi,
ca20d29275b909 Takashi Iwai      2014-02-04  1184  			  "snd_rawmidi_receive: input is not active!!!\n");
463a20fd3481de Takashi Iwai      2022-06-17  1185  		result = -EINVAL;
463a20fd3481de Takashi Iwai      2022-06-17  1186  		goto unlock;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1187  	}
08fdced60ca08e David Henningsson 2021-05-15  1188  
e3a8a5b726bdd9 Takashi Iwai      2023-05-23  1189  	count = get_aligned_size(runtime, count);
e3a8a5b726bdd9 Takashi Iwai      2023-05-23  1190  	if (!count)
e3a8a5b726bdd9 Takashi Iwai      2023-05-23  1191  		goto unlock;
e3a8a5b726bdd9 Takashi Iwai      2023-05-23  1192  
08fdced60ca08e David Henningsson 2021-05-15  1193  	if (substream->framing == SNDRV_RAWMIDI_MODE_FRAMING_TSTAMP) {
08fdced60ca08e David Henningsson 2021-05-15  1194  		result = receive_with_tstamp_framing(substream, buffer, count, &ts64);
08fdced60ca08e David Henningsson 2021-05-15  1195  	} else if (count == 1) {	/* special case, faster code */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1196  		substream->bytes++;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1197  		if (runtime->avail < runtime->buffer_size) {
5ec51b77b2e5bf Arnd Bergmann     2023-06-19  1198  			runtime->buffer[runtime->hw_ptr++] = ((u8 *)buffer)[0];
^1da177e4c3f41 Linus Torvalds    2005-04-16  1199  			runtime->hw_ptr %= runtime->buffer_size;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1200  			runtime->avail++;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1201  			result++;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1202  		} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1203  			runtime->xruns++;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1204  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1205  	} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1206  		substream->bytes += count;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1207  		count1 = runtime->buffer_size - runtime->hw_ptr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1208  		if (count1 > count)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1209  			count1 = count;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1210  		if (count1 > (int)(runtime->buffer_size - runtime->avail))
^1da177e4c3f41 Linus Torvalds    2005-04-16  1211  			count1 = runtime->buffer_size - runtime->avail;
e3a8a5b726bdd9 Takashi Iwai      2023-05-23  1212  		count1 = get_aligned_size(runtime, count1);
e3a8a5b726bdd9 Takashi Iwai      2023-05-23  1213  		if (!count1)
e3a8a5b726bdd9 Takashi Iwai      2023-05-23  1214  			goto unlock;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1215  		memcpy(runtime->buffer + runtime->hw_ptr, buffer, count1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1216  		runtime->hw_ptr += count1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1217  		runtime->hw_ptr %= runtime->buffer_size;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1218  		runtime->avail += count1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1219  		count -= count1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1220  		result += count1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1221  		if (count > 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1222  			buffer += count1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1223  			count1 = count;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1224  			if (count1 > (int)(runtime->buffer_size - runtime->avail)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1225  				count1 = runtime->buffer_size - runtime->avail;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1226  				runtime->xruns += count - count1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1227  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1228  			if (count1 > 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1229  				memcpy(runtime->buffer, buffer, count1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1230  				runtime->hw_ptr = count1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1231  				runtime->avail += count1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1232  				result += count1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1233  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1234  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1235  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1236  	if (result > 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1237  		if (runtime->event)
b3c705aa9e9147 Takashi Iwai      2011-06-14  1238  			schedule_work(&runtime->event_work);
88a06d6fd6b369 Takashi Iwai      2020-12-06  1239  		else if (__snd_rawmidi_ready(runtime))
^1da177e4c3f41 Linus Torvalds    2005-04-16  1240  			wake_up(&runtime->sleep);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1241  	}
463a20fd3481de Takashi Iwai      2022-06-17  1242   unlock:
f1d40433352e5d Takashi Iwai      2022-06-17  1243  	spin_unlock_irqrestore(&substream->lock, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1244  	return result;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1245  }
6776a5d712a1e6 Takashi Iwai      2014-02-27  1246  EXPORT_SYMBOL(snd_rawmidi_receive);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1247  

:::::: The code at line 1169 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
