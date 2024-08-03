Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D795589C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 21:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722721633; cv=none; b=qmhv44N8NHnYST7+sXJmUpfXgN6G1pM5EA9WfBECpV5vNzO1gT6PMCh5rZKS0fMZv2Q3Ad2wBknHp4rMd921+rS+r3MXpoQKTqEnvQX0woBMMai9+wPjK+PUTd/cIa3kOOsVCZ8KYcMf6c759KjteDFlanr9fwp8Qna2ibTwfBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722721633; c=relaxed/simple;
	bh=DyvhvGCZsUWAd17j/gpBKyWl4viZG07fXnUAiJG3fj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPK9yxAszp6pNuESPm2ysviKYbip+D6RJIhrSo+08q66w5zonhLJ5xE6TKeuE52ouoTFx9KjiXPGtUJOQCnJTJmpLkLtNjrLnjG/ebzkamSPhVWfRRHJeCtNokzJfis3hjm3DQvxXDMy1QiT6PdPz91iFYhYrTyIn8UuwTbUjr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7u5PTH6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7u5PTH6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722721631; x=1754257631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DyvhvGCZsUWAd17j/gpBKyWl4viZG07fXnUAiJG3fj8=;
  b=f7u5PTH6Z8BpbiH9PGg34X/SGjg1LmHJ6Phe383WAvBZw3mexlXG1KFi
   GnTuS2R4vd/QOzXmuNdy14h2H5iuI8MjRxhXBh5+n4ZE79Up9FEaxkG6R
   MLMlV8VPmvh30bo9E8q8R5OLZNdeZggYb6+xHGame9JadcX7jRbRXx/7I
   LPjAQnwm5jcbXD3ZBD4hMhFXTcXlYM6rnI5DoQdeX2mUOjH5dwNozzAr8
   yoyTlclwRn1l/GmNsFs98Gu/dLJVArcr0WJXcNmWfy/9YKHa64LmclMOi
   IMqoEQcgGEV/58NAuVIrC7A28ZxGMMWOlpCkKY6TRObNG9bBQT0klC/Vk
   A==;
X-CSE-ConnectionGUID: NQH53wDXRMCsvxSEsM9JZA==
X-CSE-MsgGUID: MgrufUkVSLKaTU4qkpUyMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="38217637"
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="38217637"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 14:47:08 -0700
X-CSE-ConnectionGUID: JAQgAfKGTuGlB5jeOgppxQ==
X-CSE-MsgGUID: NSwcGpGkS2uVrNzWtdc5Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="93311661"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 03 Aug 2024 14:47:05 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saMac-0000vW-2J;
	Sat, 03 Aug 2024 21:47:02 +0000
Date: Sun, 4 Aug 2024 05:46:09 +0800
From: kernel test robot <lkp@intel.com>
To: Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	urezki@gmail.com, hch@infradead.org, linux-mm@kvack.org,
	lee@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de, christian.gmeiner@gmail.com,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: Re: [PATCH v2 1/2] x86: Add basic support for the Congatec CGEB BIOS
 interface
Message-ID: <202408040528.OmB08hFQ-lkp@intel.com>
References: <20240801160610.101859-2-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801160610.101859-2-mstrodl@csh.rit.edu>

Hi Mary,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on lee-mfd/for-mfd-fixes andi-shyti/i2c/i2c-host akpm-mm/mm-everything linus/master v6.11-rc1 next-20240802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mary-Strodl/x86-Add-basic-support-for-the-Congatec-CGEB-BIOS-interface/20240803-013725
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20240801160610.101859-2-mstrodl%40csh.rit.edu
patch subject: [PATCH v2 1/2] x86: Add basic support for the Congatec CGEB BIOS interface
config: x86_64-randconfig-002-20240804 (https://download.01.org/0day-ci/archive/20240804/202408040528.OmB08hFQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408040528.OmB08hFQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408040528.OmB08hFQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/mfd/congatec-cgeb.o: in function `cgeb_request':
>> drivers/mfd/congatec-cgeb.c:303: undefined reference to `cn_netlink_send'
>> ld: drivers/mfd/congatec-cgeb.c:312: undefined reference to `cn_netlink_send'
   ld: drivers/mfd/congatec-cgeb.o: in function `cgeb_exit':
>> drivers/mfd/congatec-cgeb.c:1131: undefined reference to `cn_del_callback'
   ld: drivers/mfd/congatec-cgeb.o: in function `cgeb_init':
>> drivers/mfd/congatec-cgeb.c:1054: undefined reference to `cn_add_callback'
>> ld: drivers/mfd/congatec-cgeb.c:1113: undefined reference to `cn_del_callback'


vim +303 drivers/mfd/congatec-cgeb.c

   266	
   267	static int cgeb_request(struct cgeb_msg msg, struct cgeb_msg *out,
   268				int (*callback)(struct cgeb_msg*, void*), void *user)
   269	{
   270		static int seq;
   271		struct cn_msg *wrapper;
   272		struct cgeb_request *req;
   273		int err, retries = 0;
   274	
   275		wrapper = (struct cn_msg*) kzalloc(sizeof(*wrapper) + sizeof(msg),
   276						   GFP_KERNEL);
   277		if (!wrapper)
   278			return -ENOMEM;
   279	
   280		memset(wrapper, 0, sizeof(*wrapper));
   281		memcpy(&wrapper->id, &cgeb_cn_id, sizeof(cgeb_cn_id));
   282	
   283		wrapper->len = sizeof(msg);
   284		wrapper->ack = get_random_u32();
   285		memcpy(wrapper + 1, &msg, sizeof(msg));
   286	
   287		mutex_lock(&cgeb_lock);
   288	
   289		req = &cgeb_requests[seq];
   290	
   291		if (req->busy) {
   292			mutex_unlock(&cgeb_lock);
   293			err = -EBUSY;
   294			goto out;
   295		}
   296		wrapper->seq = seq;
   297		req->busy = CGEB_REQ_ACTIVE;
   298		req->ack = wrapper->ack;
   299		req->out = out;
   300		req->callback = callback;
   301		req->user = user;
   302	
 > 303		err = cn_netlink_send(wrapper, 0, 0, GFP_KERNEL);
   304		if (err == -ESRCH) {
   305			err = cgeb_helper_start();
   306			if (err) {
   307				pr_err("failed to execute %s\n", cgeb_helper_path);
   308				pr_err("make sure that the cgeb helper is installed and"
   309				       " executable\n");
   310			} else {
   311				do {
 > 312					err = cn_netlink_send(wrapper, 0, 0,
   313							      GFP_KERNEL);
   314					if (err == -ENOBUFS)
   315						err = 0;
   316					if (err == -ESRCH)
   317						msleep(30);
   318				} while (err == -ESRCH && ++retries < 5);
   319			}
   320		} else if (err == -ENOBUFS)
   321			err = 0;
   322	
   323		kfree(wrapper);
   324	
   325		if (++seq >= CGEB_REQUEST_MAX)
   326			seq = 0;
   327	
   328		mutex_unlock(&cgeb_lock);
   329	
   330		if (err)
   331			goto out;
   332	
   333		/* Wait for a response to the request */
   334		err = wait_for_completion_interruptible_timeout(
   335			&req->done, msecs_to_jiffies(20000));
   336		if (err == 0) {
   337			pr_err("CGEB: Timed out running request of type %d!\n",
   338			       msg.type);
   339			err = -ETIMEDOUT;
   340		} else if (err > 0)
   341			err = 0;
   342	
   343		if (err)
   344			goto out;
   345	
   346		mutex_lock(&cgeb_lock);
   347	
   348		if (req->busy != CGEB_REQ_DONE) {
   349			pr_err("CGEB: BUG: Request is in a bad state?\n");
   350			err = -EINVAL;
   351		}
   352	
   353		req->busy = CGEB_REQ_IDLE;
   354		mutex_unlock(&cgeb_lock);
   355	out:
   356		return err;
   357	}
   358	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
