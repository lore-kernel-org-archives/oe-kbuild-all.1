Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74A31339B1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 05:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758605822; cv=none; b=ctJbpUO7BK/U+l2FCy5PO6GXztaNFbBWevplcVGCNCDiB7vVSKx1EoUuncgTZ6+cHP/tFfFUM1WstD4SzVMjFln9cKgjkbFmAvEtMyRauQvm7basu3VODZ8KSSSxlsXRpDBtO7NCoblJ5OC/FMs5qqlc+0ThtTohOfAv7RepYq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758605822; c=relaxed/simple;
	bh=V5UL/dAIr2nm6+fzDi+IHHaER/mBixoWQUPYcglj9r0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ZYlGuOP6vqTwAKnlKFgKRkk04Mi4oNy/sYxXk00g7XMyJSnEatFyXucxZQol4oEoXspjdyM/bpKFo7MvHUXbcZb5dKaVTfEBPaUGNPaREZpUW4D+HvRZHg4jD8pju1cw1pRZ8mgzHellXHdnL7a6U+uvtK8yHmdU635JVqEQE6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PCV+nCRa; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PCV+nCRa"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ee15505cdeso3134486f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 22:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758605819; x=1759210619; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5nk68bT4tM2s7UqUaMB1Q+v6+5v9pMEz2u6IMlyeJfM=;
        b=PCV+nCRa+b2863JvV5oY2DS7a6UGKzEwMPn6P7vRvco8jiyRm8AjxGcI3/yfqbrM6l
         CvQ7G4DXscx7xt/Ft1JPoWikx5G0Be2PvFzuEeSFr/qvpiCR28DCGjWcac51EHtAPmPr
         L2ndzhZQrZzmqGw6S6gtK+YqBJ5bl9r5+rzjR+z4QeRUcE8dVGLkYURv/1wLGlz844XE
         o6MN7chJdZfioysOqQjaiinhsF9lLB6IL1yXy4gvdqS4YEEGYyZRVUo/meTND7d+gNKE
         Ey0I/akGA6LQr5VLwNPHQC3Z5kIHTLH2D/5Rj3K9+tFJYafxcpbcjqPMWG4UAXp2uzOj
         uXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758605819; x=1759210619;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5nk68bT4tM2s7UqUaMB1Q+v6+5v9pMEz2u6IMlyeJfM=;
        b=f9HeawskXPuIwY/9tLrlHeNITCD10QNwQyNRL9H7Bcz+qbLeJUTJTbn1wcHhGGZggq
         eHrHzeQxGmco3z+tMdlrLtj1EDPZlfE9MRLju8RBRGCLZLzhsUABCSkuyhmcc9O5p8hi
         9zNW33/2uMZh39/nubM0DRvidX6fNLUmvjFY1poFojQPT23TGddoGqqcJ2BpRsxdVd1R
         tUoLW0H9qHIKFxPJWq7DKmkRjePXPeKuxo7M50AGGTGaYcHWOX1P5jwFoAveDMzm7ucj
         jVTq0K/yal7kc833PcYSO1m4MpXo8BwIEZzrv/tFwaZMWvccIdKKQXkb1onPwKijieEj
         oY6g==
X-Forwarded-Encrypted: i=1; AJvYcCU5/ksEC9TP2nnALYeBYXkD0sQaxrmpPFytYkd7k3fI+kZFnzUN0OP8Neyu3acexIeO81s5fYXan9d96zfE@lists.linux.dev
X-Gm-Message-State: AOJu0YyEtEK8k9WEj/W0/zOBjHq+kyraES/faWkhjL6zI6VtC6e4e8M5
	IaO2sfKLiVwpmWQp2oeu9u4LRnLPydI52uhpXxwtze4C7hiNyyES/sIH0XZG6/+rtVY=
X-Gm-Gg: ASbGnctAoOpRw5MOqR6ZMFjAKUDrFJNnwBcxTWw1+y4eoAU7dWnmrP9rBiSumjGyJw0
	Q9VD7b19P33hmY9Uwr68kO5P6e1Y/mCl1X0AhD2rCpSAIPWGECPQdc/JyoQXKFeAOD/i81Cn2tg
	oMjxDvDbliZHcMJQZnHargLcuZW3Tb80Jjk6ngwWUgJgRWzdkbcwVoFB42/FIT0c3EETI4CkdCm
	85KQ+cy/CUBfcCig89/zxjOr83KnqU1u48+kGmx3h4pRDhREx8hk4cd6tXpf/ZuTAUb+/tmYZqw
	Alud07Qr/H90ur9aDHgHhhwO7SnHIiqH3f1YuguTku36utcQCYQwBF0/jsNdOw5dVo3FVthCqnW
	mAB8CJn9KHOn3HJGWU0uUJ2Do+spL
X-Google-Smtp-Source: AGHT+IEJTxintUDc/Y0Z2eSulhk27K76GPRZmco48nAZ6riUoZSGJo1ebPVO+aKwFwektUspb6X3Zg==
X-Received: by 2002:a5d:5f92:0:b0:3f1:aff4:1c77 with SMTP id ffacd0b85a97d-405cf9c1bcdmr917423f8f.16.1758605819067;
        Mon, 22 Sep 2025 22:36:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee0fbc7188sm23236326f8f.37.2025.09.22.22.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 22:36:58 -0700 (PDT)
Date: Tue, 23 Sep 2025 08:36:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, rajasimandalos@gmail.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] cifs: client: allow changing multichannel mount
 options on remount
Message-ID: <202509231242.5ZgtQ3Ye-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922082417.816331-2-rajasimandalos@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/rajasimandalos-gmail-com/cifs-client-allow-changing-multichannel-mount-options-on-remount/20250922-162930
base:   git://git.samba.org/sfrench/cifs-2.6.git for-next
patch link:    https://lore.kernel.org/r/20250922082417.816331-2-rajasimandalos%40gmail.com
patch subject: [PATCH 2/2] cifs: client: allow changing multichannel mount options on remount
config: x86_64-randconfig-161-20250923 (https://download.01.org/0day-ci/archive/20250923/202509231242.5ZgtQ3Ye-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509231242.5ZgtQ3Ye-lkp@intel.com/

New smatch warnings:
fs/smb/client/sess.c:327 cifs_decrease_secondary_channels() error: we previously assumed 'server' could be null (see line 314)

vim +/server +327 fs/smb/client/sess.c

1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  276  void cifs_decrease_secondary_channels(struct cifs_ses *ses, bool from_reconfigure)
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  277  {
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  278  	int i, chan_count;
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  279  	struct TCP_Server_Info *server;
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  280  	struct cifs_server_iface *iface;
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  281  
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  282  	spin_lock(&ses->chan_lock);
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  283  	chan_count = ses->chan_count;
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  284  	if (chan_count == 1)
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  285  		goto done;
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  286  
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  287  	// Update the chan_count to the new maximum
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  288  	if (from_reconfigure)
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  289  		ses->chan_count = ses->chan_max;
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  290  	else
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  291  		ses->chan_count = 1;

ses->chan_count is set here.

ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  292  
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  293  	for (i = ses->chan_max ; i < chan_count; i++) {
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  294  		iface = ses->chans[i].iface;
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  295  		server = ses->chans[i].server;
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  296  
5eef12c4e3230f fs/smb/client/sess.c Shyam Prasad N   2023-11-14  297  		/*
5eef12c4e3230f fs/smb/client/sess.c Shyam Prasad N   2023-11-14  298  		 * remove these references first, since we need to unlock
5eef12c4e3230f fs/smb/client/sess.c Shyam Prasad N   2023-11-14  299  		 * the chan_lock here, since iface_lock is a higher lock
5eef12c4e3230f fs/smb/client/sess.c Shyam Prasad N   2023-11-14  300  		 */
5eef12c4e3230f fs/smb/client/sess.c Shyam Prasad N   2023-11-14  301  		ses->chans[i].iface = NULL;
5eef12c4e3230f fs/smb/client/sess.c Shyam Prasad N   2023-11-14  302  		ses->chans[i].server = NULL;
5eef12c4e3230f fs/smb/client/sess.c Shyam Prasad N   2023-11-14  303  		spin_unlock(&ses->chan_lock);
5eef12c4e3230f fs/smb/client/sess.c Shyam Prasad N   2023-11-14  304  
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  305  		if (iface) {
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  306  			spin_lock(&ses->iface_lock);
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  307  			iface->num_channels--;
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  308  			if (iface->weight_fulfilled)
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  309  				iface->weight_fulfilled--;
a15ccef82d3de9 fs/smb/client/sess.c Ritvik Budhiraja 2023-11-21  310  			kref_put(&iface->refcount, release_iface);
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  311  			spin_unlock(&ses->iface_lock);
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  312  		}
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  313  
5eef12c4e3230f fs/smb/client/sess.c Shyam Prasad N   2023-11-14 @314  		if (server) {

This shows that server can be NULL

5eef12c4e3230f fs/smb/client/sess.c Shyam Prasad N   2023-11-14  315  			if (!server->terminate) {
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  316  				server->terminate = true;
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  317  				cifs_signal_cifsd_for_reconnect(server, false);
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  318  			}
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  319  			cifs_put_tcp_session(server, false);
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  320  		}
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  321  
5eef12c4e3230f fs/smb/client/sess.c Shyam Prasad N   2023-11-14  322  		spin_lock(&ses->chan_lock);
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  323  	}
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  324  
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  325  	/* For extra secondary channels, reset the need reconnect bit */
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  326  	if (ses->chan_count == 1) {
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22 @327  		cifs_server_dbg(VFS, "server does not support multichannel anymore. Disable all other channels\n");

I guess the cifs_server_dbg() macro dereferences server?

1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  328  		ses->chans_need_reconnect &= 1;
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  329  	} else {
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  330  		cifs_server_dbg(VFS, "Disable extra secondary channels\n");
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  331  		ses->chans_need_reconnect &= ((1UL << ses->chan_max) - 1);
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  332  	}
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  333  
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  334  done:
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  335  	spin_unlock(&ses->chan_lock);
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  336  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

