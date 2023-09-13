Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE55264C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 22:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694644624; x=1726180624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4la7L2bM/2fbIN4DbKVyOdCmFRmtecd/MviUFYxuh3k=;
  b=mJAPm4+m0EBSm6+5BNFF0EenZYIRPzNwcS3IbG+Xjl+9GTQo9aGLjgSt
   c8ya5EEexlJAkzxttI47YWkvcvGVv9Qpfrol6VuR1p9LaQd5BtOShNv9X
   AmOHzq71ySobVTHhq3YzYMCUQbXffM9xXvOaTUzeE3NWsXVAoQCimldKs
   /5TatXU2kuWqgn1m///qL0lDP79803kH+7c2CkDmg6BTYaxv37sNJ2n48
   og8DYk3SBLePyLC8XqGyM9r5JG62qUUp5yxePAqAgH4+Vm6e+Zzx/s8kc
   0UwJ/2KQuNaoM39l1YbVkkMEbOmw/+6uTMPWr5s9bKk/VrKhURYYiPZOZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="442829766"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="442829766"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 15:37:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="747499403"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="747499403"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 13 Sep 2023 15:37:01 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgYT9-0000l1-08;
	Wed, 13 Sep 2023 22:36:25 +0000
Date: Thu, 14 Sep 2023 06:35:31 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-cleanup 3/13] sound/core/pcm_native.c:3530:16:
 error: 'struct iov_iter' has no member named 'user_backed'
Message-ID: <202309140636.QRnbB1Vd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-cleanup
head:   bbca19708859dff75c7d28b9cb73f114497d6f60
commit: 4336b89e6c0cbdd1ef25bb321f105f066d462e25 [3/13] iov_iter: Derive user-backedness from the iterator type
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230914/202309140636.QRnbB1Vd-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140636.QRnbB1Vd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140636.QRnbB1Vd-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/core/pcm_native.c: In function 'snd_pcm_readv':
>> sound/core/pcm_native.c:3530:16: error: 'struct iov_iter' has no member named 'user_backed'
    3530 |         if (!to->user_backed)
         |                ^~
   sound/core/pcm_native.c: In function 'snd_pcm_writev':
   sound/core/pcm_native.c:3570:18: error: 'struct iov_iter' has no member named 'user_backed'
    3570 |         if (!from->user_backed)
         |                  ^~


vim +3530 sound/core/pcm_native.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  3510  
1c65d98672e09a Al Viro          2015-04-04  3511  static ssize_t snd_pcm_readv(struct kiocb *iocb, struct iov_iter *to)
^1da177e4c3f41 Linus Torvalds   2005-04-16  3512  {
877211f5e1b119 Takashi Iwai     2005-11-17  3513  	struct snd_pcm_file *pcm_file;
877211f5e1b119 Takashi Iwai     2005-11-17  3514  	struct snd_pcm_substream *substream;
877211f5e1b119 Takashi Iwai     2005-11-17  3515  	struct snd_pcm_runtime *runtime;
^1da177e4c3f41 Linus Torvalds   2005-04-16  3516  	snd_pcm_sframes_t result;
^1da177e4c3f41 Linus Torvalds   2005-04-16  3517  	unsigned long i;
^1da177e4c3f41 Linus Torvalds   2005-04-16  3518  	void __user **bufs;
^1da177e4c3f41 Linus Torvalds   2005-04-16  3519  	snd_pcm_uframes_t frames;
de4f5fed3f231a Jens Axboe       2023-03-29  3520  	const struct iovec *iov = iter_iov(to);
^1da177e4c3f41 Linus Torvalds   2005-04-16  3521  
ee0b3e671baff6 Badari Pulavarty 2006-09-30  3522  	pcm_file = iocb->ki_filp->private_data;
^1da177e4c3f41 Linus Torvalds   2005-04-16  3523  	substream = pcm_file->substream;
7eaa943c8ed8e9 Takashi Iwai     2008-08-08  3524  	if (PCM_RUNTIME_CHECK(substream))
7eaa943c8ed8e9 Takashi Iwai     2008-08-08  3525  		return -ENXIO;
^1da177e4c3f41 Linus Torvalds   2005-04-16  3526  	runtime = substream->runtime;
f0061c18c169f0 Takashi Iwai     2022-09-26  3527  	if (runtime->state == SNDRV_PCM_STATE_OPEN ||
f0061c18c169f0 Takashi Iwai     2022-09-26  3528  	    runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
^1da177e4c3f41 Linus Torvalds   2005-04-16  3529  		return -EBADFD;
e4d3202c18329b Jens Axboe       2023-03-28 @3530  	if (!to->user_backed)
1c65d98672e09a Al Viro          2015-04-04  3531  		return -EINVAL;
1c65d98672e09a Al Viro          2015-04-04  3532  	if (to->nr_segs > 1024 || to->nr_segs != runtime->channels)
^1da177e4c3f41 Linus Torvalds   2005-04-16  3533  		return -EINVAL;
de4f5fed3f231a Jens Axboe       2023-03-29  3534  	if (!frame_aligned(runtime, iov->iov_len))
^1da177e4c3f41 Linus Torvalds   2005-04-16  3535  		return -EINVAL;
de4f5fed3f231a Jens Axboe       2023-03-29  3536  	frames = bytes_to_samples(runtime, iov->iov_len);
6da2ec56059c3c Kees Cook        2018-06-12  3537  	bufs = kmalloc_array(to->nr_segs, sizeof(void *), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds   2005-04-16  3538  	if (bufs == NULL)
^1da177e4c3f41 Linus Torvalds   2005-04-16  3539  		return -ENOMEM;
de4f5fed3f231a Jens Axboe       2023-03-29  3540  	for (i = 0; i < to->nr_segs; ++i) {
de4f5fed3f231a Jens Axboe       2023-03-29  3541  		bufs[i] = iov->iov_base;
de4f5fed3f231a Jens Axboe       2023-03-29  3542  		iov++;
de4f5fed3f231a Jens Axboe       2023-03-29  3543  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  3544  	result = snd_pcm_lib_readv(substream, bufs, frames);
^1da177e4c3f41 Linus Torvalds   2005-04-16  3545  	if (result > 0)
^1da177e4c3f41 Linus Torvalds   2005-04-16  3546  		result = frames_to_bytes(runtime, result);
^1da177e4c3f41 Linus Torvalds   2005-04-16  3547  	kfree(bufs);
^1da177e4c3f41 Linus Torvalds   2005-04-16  3548  	return result;
^1da177e4c3f41 Linus Torvalds   2005-04-16  3549  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  3550  

:::::: The code at line 3530 was first introduced by commit
:::::: e4d3202c18329ba2733c9e04489b6ef05d3bce08 ALSA: pcm: check for user backed iterator, not specific iterator type

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
