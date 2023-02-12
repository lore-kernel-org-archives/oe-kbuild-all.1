Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1DE2FAE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Feb 2023 16:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676219930; x=1707755930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A6nwNseFVyd9hFNSVmsnAkMhnkgo68hWquTjBKayVmA=;
  b=bFaYR+ZCXriEJpkiEzm4QjM1vHLfeiGi8zHF3+0N2obmsDdK59EjcZsw
   OQ4kkGrqAZQhzVwd5l0Ve1LRMXKKuzHCIkndLFAhmjOpdvTCw2iY2Ka8t
   xENzdiokx1uYidbq3WNMRoQUc7tl/8aVoHh4FU4Y/NdoaxzxlhEcflfgY
   jxLfQucDGWLmUeSn7oEfDEoz0NS+c4KXmzeicnB7FL8HWKU7A6m14lA+w
   9u5PDGyHjgN+3YtgaCrkYl5mIC2/K3T2Ooxndtno2pKlGe6LORZumqaeH
   wr9l+p/Igdz1fgxe1zTpLFChmxEOxssi56x8Wn8EYU/X35YfBVMuW/XfM
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="311091028"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="311091028"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 08:38:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="646143780"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="646143780"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Feb 2023 08:38:47 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRFNG-0007I9-2k;
	Sun, 12 Feb 2023 16:38:46 +0000
Date: Mon, 13 Feb 2023 00:38:40 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: arch/s390/boot/compressed/../../../../lib/decompress_bunzip2.c:709:24:
 warning: passing 'unsigned char *' to parameter of type 'char *' converts
 between pointers to integer types where one is of the unique plain 'char'
 type and the other is not
Message-ID: <202302130039.fP1yAJ9g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guenter,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 08c17be52b99119c96cc997a4ecd0f44e0183e26 CHROMIUM: Revert "ecryptfs_lookup(): try either only encrypted or plaintext name"
date:   2 years, 2 months ago
config: s390-randconfig-r025-20230212 (https://download.01.org/0day-ci/archive/20230213/202302130039.fP1yAJ9g-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=08c17be52b99119c96cc997a4ecd0f44e0183e26
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout 08c17be52b99119c96cc997a4ecd0f44e0183e26
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302130039.fP1yAJ9g-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/s390/boot/compressed/decompressor.c:45:
>> arch/s390/boot/compressed/../../../../lib/decompress_bunzip2.c:709:24: warning: passing 'unsigned char *' to parameter of type 'char *' converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
                           i = read_bunzip(bd, outbuf, BZIP2_IOBUF_SIZE);
                                               ^~~~~~
   arch/s390/boot/compressed/../../../../lib/decompress_bunzip2.c:523:59: note: passing argument to parameter 'outbuf' here
   static int INIT read_bunzip(struct bunzip_data *bd, char *outbuf, int len)
                                                             ^
   1 warning generated.


vim +709 arch/s390/boot/compressed/../../../../lib/decompress_bunzip2.c

bc22c17e12c130 Alain Knaff     2009-01-04  676  
bc22c17e12c130 Alain Knaff     2009-01-04  677  /* Example usage: decompress src_fd to dst_fd.  (Stops at end of bzip2 data,
bc22c17e12c130 Alain Knaff     2009-01-04  678     not end of file.) */
d97b07c54f34e8 Yinghai Lu      2014-08-08  679  STATIC int INIT bunzip2(unsigned char *buf, long len,
d97b07c54f34e8 Yinghai Lu      2014-08-08  680  			long (*fill)(void*, unsigned long),
d97b07c54f34e8 Yinghai Lu      2014-08-08  681  			long (*flush)(void*, unsigned long),
bc22c17e12c130 Alain Knaff     2009-01-04  682  			unsigned char *outbuf,
d97b07c54f34e8 Yinghai Lu      2014-08-08  683  			long *pos,
93685ad247ef65 Lasse Collin    2011-01-12  684  			void(*error)(char *x))
bc22c17e12c130 Alain Knaff     2009-01-04  685  {
bc22c17e12c130 Alain Knaff     2009-01-04  686  	struct bunzip_data *bd;
bc22c17e12c130 Alain Knaff     2009-01-04  687  	int i = -1;
bc22c17e12c130 Alain Knaff     2009-01-04  688  	unsigned char *inbuf;
bc22c17e12c130 Alain Knaff     2009-01-04  689  
bc22c17e12c130 Alain Knaff     2009-01-04  690  	if (flush)
bc22c17e12c130 Alain Knaff     2009-01-04  691  		outbuf = malloc(BZIP2_IOBUF_SIZE);
b1af4315d823a2 Phillip Lougher 2009-08-06  692  
bc22c17e12c130 Alain Knaff     2009-01-04  693  	if (!outbuf) {
90802ed9c3dbab Paul Bolle      2011-12-05  694  		error("Could not allocate output buffer");
d4529862cae4de Phillip Lougher 2009-12-14  695  		return RETVAL_OUT_OF_MEMORY;
bc22c17e12c130 Alain Knaff     2009-01-04  696  	}
bc22c17e12c130 Alain Knaff     2009-01-04  697  	if (buf)
bc22c17e12c130 Alain Knaff     2009-01-04  698  		inbuf = buf;
bc22c17e12c130 Alain Knaff     2009-01-04  699  	else
bc22c17e12c130 Alain Knaff     2009-01-04  700  		inbuf = malloc(BZIP2_IOBUF_SIZE);
bc22c17e12c130 Alain Knaff     2009-01-04  701  	if (!inbuf) {
90802ed9c3dbab Paul Bolle      2011-12-05  702  		error("Could not allocate input buffer");
d4529862cae4de Phillip Lougher 2009-12-14  703  		i = RETVAL_OUT_OF_MEMORY;
bc22c17e12c130 Alain Knaff     2009-01-04  704  		goto exit_0;
bc22c17e12c130 Alain Knaff     2009-01-04  705  	}
bc22c17e12c130 Alain Knaff     2009-01-04  706  	i = start_bunzip(&bd, inbuf, len, fill);
bc22c17e12c130 Alain Knaff     2009-01-04  707  	if (!i) {
bc22c17e12c130 Alain Knaff     2009-01-04  708  		for (;;) {
bc22c17e12c130 Alain Knaff     2009-01-04 @709  			i = read_bunzip(bd, outbuf, BZIP2_IOBUF_SIZE);
bc22c17e12c130 Alain Knaff     2009-01-04  710  			if (i <= 0)
bc22c17e12c130 Alain Knaff     2009-01-04  711  				break;
bc22c17e12c130 Alain Knaff     2009-01-04  712  			if (!flush)
bc22c17e12c130 Alain Knaff     2009-01-04  713  				outbuf += i;
bc22c17e12c130 Alain Knaff     2009-01-04  714  			else
bc22c17e12c130 Alain Knaff     2009-01-04  715  				if (i != flush(outbuf, i)) {
bc22c17e12c130 Alain Knaff     2009-01-04  716  					i = RETVAL_UNEXPECTED_OUTPUT_EOF;
bc22c17e12c130 Alain Knaff     2009-01-04  717  					break;
bc22c17e12c130 Alain Knaff     2009-01-04  718  				}
bc22c17e12c130 Alain Knaff     2009-01-04  719  		}
bc22c17e12c130 Alain Knaff     2009-01-04  720  	}
bc22c17e12c130 Alain Knaff     2009-01-04  721  	/* Check CRC and release memory */
bc22c17e12c130 Alain Knaff     2009-01-04  722  	if (i == RETVAL_LAST_BLOCK) {
bc22c17e12c130 Alain Knaff     2009-01-04  723  		if (bd->headerCRC != bd->totalCRC)
bc22c17e12c130 Alain Knaff     2009-01-04  724  			error("Data integrity error when decompressing.");
bc22c17e12c130 Alain Knaff     2009-01-04  725  		else
bc22c17e12c130 Alain Knaff     2009-01-04  726  			i = RETVAL_OK;
bc22c17e12c130 Alain Knaff     2009-01-04  727  	} else if (i == RETVAL_UNEXPECTED_OUTPUT_EOF) {
bc22c17e12c130 Alain Knaff     2009-01-04  728  		error("Compressed file ends unexpectedly");
bc22c17e12c130 Alain Knaff     2009-01-04  729  	}
d4529862cae4de Phillip Lougher 2009-12-14  730  	if (!bd)
d4529862cae4de Phillip Lougher 2009-12-14  731  		goto exit_1;
bc22c17e12c130 Alain Knaff     2009-01-04  732  	if (bd->dbuf)
bc22c17e12c130 Alain Knaff     2009-01-04  733  		large_free(bd->dbuf);
bc22c17e12c130 Alain Knaff     2009-01-04  734  	if (pos)
bc22c17e12c130 Alain Knaff     2009-01-04  735  		*pos = bd->inbufPos;
bc22c17e12c130 Alain Knaff     2009-01-04  736  	free(bd);
d4529862cae4de Phillip Lougher 2009-12-14  737  exit_1:
bc22c17e12c130 Alain Knaff     2009-01-04  738  	if (!buf)
bc22c17e12c130 Alain Knaff     2009-01-04  739  		free(inbuf);
bc22c17e12c130 Alain Knaff     2009-01-04  740  exit_0:
bc22c17e12c130 Alain Knaff     2009-01-04  741  	if (flush)
bc22c17e12c130 Alain Knaff     2009-01-04  742  		free(outbuf);
bc22c17e12c130 Alain Knaff     2009-01-04  743  	return i;
bc22c17e12c130 Alain Knaff     2009-01-04  744  }
bc22c17e12c130 Alain Knaff     2009-01-04  745  

:::::: The code at line 709 was first introduced by commit
:::::: bc22c17e12c130dc929218a95aa347e0f3fd05dc bzip2/lzma: library support for gzip, bzip2 and lzma decompression

:::::: TO: Alain Knaff <alain@knaff.lu>
:::::: CC: H. Peter Anvin <hpa@zytor.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
