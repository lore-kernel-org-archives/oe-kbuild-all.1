Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4229C39768A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 07:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066305; cv=none; b=CQgy+tsmNiTaG5q6Chzxh2ADCACrEru+QonS8lZbBMVGlzA5XFWlV0N8lcdgcq4zzoj3o3xj9lr5n/ExADvT6SoQ/Z5N7nuePwXg/JLo4GzDePFKT0ZUVVud7Rhjyl491wCTOgD1Zmc/nai2bA9akaXDz+ZjTs5DlamSFWxkX+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066305; c=relaxed/simple;
	bh=EhoLnscEdSif09V3BiZD5njhQLHP3bClGuHIqwupXKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mqd+IsgisVpTQuMhxkix+dJYvWO+WdizMY0L9mK/C7RsZAI5i0aB2/A48F/tuQf6mKiXgP12I6qUvlCaTCeKakTU7/8l5rXZ3e6y6LZx6DoDJVxcJvtGwR6Pf1PF1UqN/RYgLp5pXgmAVZpYt0EccpCHeI6x4ZztQq5VvAT6xhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pnYCDMFO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pnYCDMFO"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso42979365e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 00:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066303; x=1776671103; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IFBTnsUYXqhDI5NnHFE73UwnXCIbelAw1exwYRkRb5Q=;
        b=pnYCDMFORNwhSHv1keUEfipkMRt7SDdLE5z1fW5Vx0hsbzzHkV5vE3YVs9X1N4Rtq7
         3KmmF9g8BNnMEsb0c9exi7T0P9DjOqzrjwaDDJEpFUeCckywdZ6x8izzNVS2/+ZTSRLb
         NKzRJZjwajQQ2eW0+cmVYKptVCGIg9dRZ0WPbNL335uiFQekhkNegpw543uOI/QVkfqk
         DNG0N1kjgJZKRgduh0RrYiPNOwTeF3sXpATogWy3TiQNikAM58XgMALRrKRR9YFzedcb
         3odI0hKQ1q8JhW/U361dYkcH47TR9Do8/ihbjYvJ+SE4dRK1+I4NzCCWTVfzcrEAFQMk
         s6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066303; x=1776671103;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFBTnsUYXqhDI5NnHFE73UwnXCIbelAw1exwYRkRb5Q=;
        b=lz7zJIXHD7l7OxMyEGpMgRe7SZdq+qaXMBOvpBRYcHb5hHKgX6WLV0HGuDvEhx0kzd
         Fp5DiGuJSplB+sWJLPxLAwrPjIfnz9T9kHT9TFoaMUsuglJnFeZDUJGXvzjWKSWksnh3
         ia2ZXAFbfoGncW3GoxEKyrqcUeCNAYXM+zyjL4+kvR/xS6w1OfZFpp1mckxfNFP6zXLq
         JqTbLVPLt3ZRIURh9MEwGbDNOKYwnwXao/DSC83vtmTUxpDVIoDCzEuMbO4A76cYxs1L
         j1mDwOA4vz1R/ND5JphUvTzKJCH+u7TbaUbL18cM+j7Z+roz/cEmfqfiaWbYwqOYtA0h
         MIhw==
X-Forwarded-Encrypted: i=1; AFNElJ92P/PmPJryzRWtetP1T0BOTg1OXdylRt5Mff3mgihfqAEsOjaCEfl+DNUCGR2tpbT297HTrTORpac+YWy5@lists.linux.dev
X-Gm-Message-State: AOJu0YzDTCJtYrpC30sXxSCuYd1+s42/n22SpfBlV93f4afRu/FsCXp4
	BGtz7fGkkZSMn3eKjxlwF3bmVqfRbMXbqO10A2OZIkDTGFfSBRP+KFeg
X-Gm-Gg: AeBDieutjAZgAyCFlbw7Qsbkj0gInKw7pchx+Q+gh9kw3qwJKfyGLPbJ1MlLfeZQjsu
	0BR9/pFBhpQ18J9Qts5n5Bji7cmtduvOn/69BiFz0V9DLCawmbrqE+YA4b60LpMyp4n71LNXF5E
	/THe0EY7ReOetWCTBDp7IqyUZO4zzuP2Sh0VZnFRbdZFFmetQmtNYqRkTSVlLY6s7cXRZT2pdJI
	I/+qcl0O+AM/ieJSRNvYLCPhZaYu54B16/a70DsiszX5KuMk7txEZTvkD8SI50gZen6H4q6yBUD
	PGRiun4vQnOEa8M6mcAYYoa4ZMzWh0HWN+VDsDs7vqseX0/3qiehMHdZyErHko+mATbe2OnsDSA
	IKVJBF2PmA5EVEfT0B0nhj8ronC9sy2xoNkQap9P4Sg5plAdLjXJQeogQgtAle4RJnqINetlAY+
	p7Ch+1P3DKHpRnGNg4xfA=
X-Received: by 2002:a05:600d:d:b0:488:ba5f:984f with SMTP id 5b1f17b1804b1-488d67b8dadmr129963085e9.6.1776066302392;
        Mon, 13 Apr 2026 00:45:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67b4903sm114545315e9.5.2026.04.13.00.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:45:01 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:44:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Haren Myneni <haren@linux.ibm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mahesh Salgaonkar <mahesh@linux.ibm.com>,
	Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: arch/powerpc/platforms/pseries/papr-hvpipe.c:214
 hvpipe_rtas_recv_msg() warn: maybe return -EFAULT instead of the bytes
 remaining?
Message-ID: <202604121903.MkgWjl8q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f5459048c38a00fc583658d6dcd0f894aff6df8f
commit: cebdb522fd3edd1fe05f7b4a74a27da7dd0f8d86 powerpc/pseries: Receive payload with ibm,receive-hvpipe-msg RTAS
config: powerpc64-randconfig-r071-20260412 (https://download.01.org/0day-ci/archive/20260412/202604121903.MkgWjl8q-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cebdb522fd3e ("powerpc/pseries: Receive payload with ibm,receive-hvpipe-msg RTAS")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604121903.MkgWjl8q-lkp@intel.com/

New smatch warnings:
arch/powerpc/platforms/pseries/papr-hvpipe.c:214 hvpipe_rtas_recv_msg() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
arch/powerpc/platforms/pseries/papr-hvpipe.c:360 papr_hvpipe_handle_read() warn: maybe return -EFAULT instead of the bytes remaining?

vim +214 arch/powerpc/platforms/pseries/papr-hvpipe.c

cebdb522fd3edd Haren Myneni 2025-09-09  174  static int hvpipe_rtas_recv_msg(char __user *buf, int size)
cebdb522fd3edd Haren Myneni 2025-09-09  175  {
cebdb522fd3edd Haren Myneni 2025-09-09  176  	struct rtas_work_area *work_area;
cebdb522fd3edd Haren Myneni 2025-09-09  177  	u32 srcID, bytes_written;
cebdb522fd3edd Haren Myneni 2025-09-09  178  	int ret;
cebdb522fd3edd Haren Myneni 2025-09-09  179  
cebdb522fd3edd Haren Myneni 2025-09-09  180  	work_area = rtas_work_area_alloc(SZ_4K);
cebdb522fd3edd Haren Myneni 2025-09-09  181  	if (!work_area) {
cebdb522fd3edd Haren Myneni 2025-09-09  182  		pr_err("Could not allocate RTAS buffer for recv pipe\n");
cebdb522fd3edd Haren Myneni 2025-09-09  183  		return -ENOMEM;
cebdb522fd3edd Haren Myneni 2025-09-09  184  	}
cebdb522fd3edd Haren Myneni 2025-09-09  185  
cebdb522fd3edd Haren Myneni 2025-09-09  186  	ret = rtas_ibm_receive_hvpipe_msg(work_area, &srcID,
cebdb522fd3edd Haren Myneni 2025-09-09  187  					&bytes_written);
cebdb522fd3edd Haren Myneni 2025-09-09  188  	if (!ret) {

Flip this around.  Always do error handling, not success handling.
Otherwise imagine if we have 9 successful calls in a row, that would be
10 tabs so we would be beyond the end of the 80 character limit.

	if (ret) {
		pr_err("ibm,receive-hvpipe-msg failed with %d\n", ret);
		goto free_work_area;
	}

cebdb522fd3edd Haren Myneni 2025-09-09  189  		/*
cebdb522fd3edd Haren Myneni 2025-09-09  190  		 * Recv HVPIPE RTAS is successful.
cebdb522fd3edd Haren Myneni 2025-09-09  191  		 * When releasing FD or no one is waiting on the
cebdb522fd3edd Haren Myneni 2025-09-09  192  		 * specific source, issue recv HVPIPE RTAS call
cebdb522fd3edd Haren Myneni 2025-09-09  193  		 * so that pipe is not blocked - this func is called
cebdb522fd3edd Haren Myneni 2025-09-09  194  		 * with NULL buf.
cebdb522fd3edd Haren Myneni 2025-09-09  195  		 */
cebdb522fd3edd Haren Myneni 2025-09-09  196  		if (buf) {

	if (!buf) {
		/* blah blah blah explanation */
		ret = 0;
		goto free_work_area;
	}

cebdb522fd3edd Haren Myneni 2025-09-09  197  			if (size < bytes_written) {
cebdb522fd3edd Haren Myneni 2025-09-09  198  				pr_err("Received the payload size = %d, but the buffer size = %d\n",
cebdb522fd3edd Haren Myneni 2025-09-09  199  					bytes_written, size);
cebdb522fd3edd Haren Myneni 2025-09-09  200  				bytes_written = size;
cebdb522fd3edd Haren Myneni 2025-09-09  201  			}
cebdb522fd3edd Haren Myneni 2025-09-09  202  			ret = copy_to_user(buf,
cebdb522fd3edd Haren Myneni 2025-09-09  203  					rtas_work_area_raw_buf(work_area),
cebdb522fd3edd Haren Myneni 2025-09-09  204  					bytes_written);
cebdb522fd3edd Haren Myneni 2025-09-09  205  			if (!ret)
cebdb522fd3edd Haren Myneni 2025-09-09  206  				ret = bytes_written;

Heh.  Now ret either holds the number of bytes_written or the number of
bytes not written and we have no idea which it is.

	if (copy_to_user(buf, rtas_work_area_raw_buf(work_area),
			 bytes_written))
		ret = -EFAULT;
	else
		ret = bytes_written;

cebdb522fd3edd Haren Myneni 2025-09-09  207  		}
cebdb522fd3edd Haren Myneni 2025-09-09  208  	} else {
cebdb522fd3edd Haren Myneni 2025-09-09  209  		pr_err("ibm,receive-hvpipe-msg failed with %d\n",
cebdb522fd3edd Haren Myneni 2025-09-09  210  				ret);
cebdb522fd3edd Haren Myneni 2025-09-09  211  	}
cebdb522fd3edd Haren Myneni 2025-09-09  212  
cebdb522fd3edd Haren Myneni 2025-09-09  213  	rtas_work_area_free(work_area);
cebdb522fd3edd Haren Myneni 2025-09-09 @214  	return ret;
cebdb522fd3edd Haren Myneni 2025-09-09  215  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

