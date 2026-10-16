Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6003EEAD8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139827; cv=none; b=jiZ68cZlUjPSq+zIE+p2jHsU+Xwjw+mvbfXU/OhKwJEgJQpAJsfBelSA4TEjsuNqUePRrm6ZTjwX5cJlbfYp27mz2DyU7fwyZ07AQbBuFLlDsTv7Sm2E0jP2JekefMVUwAEur+93KK1WcLHuaDpCAtnGx7d0ImfEML8PEbnHY6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139827; c=relaxed/simple;
	bh=v61+oQu0Uub7mJelOV/BcV4e2C5pfDr6dV6Qg0I3fMk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VJwE/2cM6z3uU4WHhkLCr0qGbX6Nqd1eXpayYndNE/kZHaJGP6EUo+bWnG8fy2EnW1EhJvP2gWYTAcjtpEN0zAZ+4I2zBYYCV2RVyqPwdBDZWuFCi0uuzsta96r5QyN7Fr2Njj7niWQvaXiGC91Uq9QqfB17U6ar4y3XFpVxcnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mN/O3vCB; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mN/O3vCB"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so56149615e9.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 01:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792139823; x=1792744623; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qblXGFHBRDlmSX/Am9ZFJWisiD8/1L6Ooxh/fKPw1h0=;
        b=mN/O3vCBSvoB/IGH0jdB0odGOr9YHQSEHt5YAenRdhBb2KBub8qXspZVHMinhpCow9
         U1ct8HDVc8xCsgkQUZhP2dHak2JN2GRgnwEewxZUI1V8WLxV3vYhKBCymf/ZyC+9TYZA
         SChAYJiX+tn02dfU1CWEIuWCMIH7G85+bSzFZETBn8BIpWbMBTEvXIGbISNhqv5sATgB
         Q4uoExeL3xwkn2QlplWzWP09DTfypoNpZlU7abV5DNIeLMXKxFA5DwXxBsObwk0sg84s
         rwDYBha0bPQFUIWsiKUhFvBPfBMQGf2EYEYCEjLSvzUhzNow3csLpO+vJo7J26g3aZzK
         sVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139823; x=1792744623;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qblXGFHBRDlmSX/Am9ZFJWisiD8/1L6Ooxh/fKPw1h0=;
        b=FCXRCQyBwgvABswVbUsbxMgg28XGvn0sRBddsXpdazl/H8LG09dQT/T7HZvtrSIo02
         nYAX4Teh46AhTrVcYi6uDm8f/kzbRMxISs+1wjXZkl2/wvMl5ZfXfKXNZR5QEcBAr866
         Uufwjbb1kLPEQiqTKFEFmvXD6M5AaDNTbyWIlgh9hOgkPL5dwpICpasF7jcwlW+F2laj
         eu48AkSYAjYda0PoTIu/R70JH7gvE0V1EoL5uRjEdMFu4VZRc94FMvDp/gN6KGZfkB52
         b3PEMSDUl4mmqg9JGFQNzoYMNQDxQgRiVG9Emzjooy3c86U4Wc3wkz4B41mt53oiS5wl
         7/Kg==
X-Forwarded-Encrypted: i=1; AKwUvBx7ImNiQoQX6qedypTnSvg05WHuj8MTsXGVi5zRGKhb97e8XIb9oPWfZnX3cXNo2SP2c08U709uH9cGS5ba@lists.linux.dev
X-Gm-Message-State: AFq9FYJ2DQvwWNaVt1bt88zzhYMsTUpjh0wpQwdteWghm4/61OiXMMly
	kErPJZcAxIZ9JVs1H4Hf/2c+Fk0F07GxzdgCI4F6XhW7bA0FZVjE2DEE
X-Gm-Gg: AYBFou0JeeNjF668z8vFjbs9ICzbm77lVgslre3IxyDsq2wwixAwGDAhohx1wcONHMn
	Sg7P0egQe8j2Kxvl+TPCF321fxT+XqF7i13HIvo9ScPfD5RaCTGmT0XbmxdWQtgCDpkU+PmE9gY
	SI4GNq5kC0wGdDBTqDv63kE9JjlMd5cEJ0Nxr3Tg4U12Ia+rYdZwQFfL90sn/D9XGSzJEGk6dqh
	avK+nWk2ou6CGb3h76DBcNl+JuYDrczxYrFD3fQYP70U9RMDiH+CgU5438EzLIcc373GO8OEoa+
	W0vuiWmdq1RlZCxCRAPVcPdeiSHtBd3vicEY7V4EbxVAo8p8iixaOkRjgH/K8t7n8WMvD4OPyNi
	SZmXkvVTSJTw1/rx3IKaLGO9yJgRvdSeECv1TOeSGk2zHY+LyCwF87+bIyDK/LEkjk4tH0PkIgY
	SYyfk8GlfjiaPmIRZ7Wyx7762hhjiKoKPyfVVwr0ddfwf30WIG8PYd4GDeArlYI6+2rZRU1f9zm
	HnCug==
X-Received: by 2002:a05:600c:3111:b0:4a0:1e87:910 with SMTP id 5b1f17b1804b1-4a18e4cb7a9mr431914885e9.20.1792139822886;
        Fri, 16 Oct 2026 01:37:02 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdbb4a30sm129989515e9.15.2026.10.16.01.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:37:01 -0700 (PDT)
Date: Fri, 16 Oct 2026 11:36:57 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, David Howells <dhowells@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 30/30] fs/netfs/direct_write.c:54
 netfs_rmw_read_one() warn: signedness bug returning '(-12)'
Message-ID: <202610082353.hZ3FyTnt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   870d31c7b4cbee9e73019466181a2e0c2c1094f8
commit: 870d31c7b4cbee9e73019466181a2e0c2c1094f8 [30/30] netfs: Support encryption on unbuffered/DIO write
config: i386-randconfig-2200-20261008 (https://download.01.org/0day-ci/archive/20261008/202610082353.hZ3FyTnt-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610082353.hZ3FyTnt-lkp@intel.com/

smatch warnings:
fs/netfs/direct_write.c:54 netfs_rmw_read_one() warn: signedness bug returning '(-12)'

vim +54 fs/netfs/direct_write.c

870d31c7b4cbee9 David Howells 2026-05-16  16  static bool netfs_rmw_read_one(struct netfs_io_request *rreq, struct bvecq *bq,
                                                     ^^^^

this is bool

870d31c7b4cbee9 David Howells 2026-05-16  17  			       uoff_t fpos)
870d31c7b4cbee9 David Howells 2026-05-16  18  {
870d31c7b4cbee9 David Howells 2026-05-16  19  	struct netfs_io_stream *stream = &rreq->io_streams[0];
870d31c7b4cbee9 David Howells 2026-05-16  20  	size_t len = 0;
870d31c7b4cbee9 David Howells 2026-05-16  21  	int ret = 0;
870d31c7b4cbee9 David Howells 2026-05-16  22  
870d31c7b4cbee9 David Howells 2026-05-16  23  	for (int i = 0; i < bq->nr_slots; i++)
870d31c7b4cbee9 David Howells 2026-05-16  24  		len += bq->bv[i].bv_len;
870d31c7b4cbee9 David Howells 2026-05-16  25  
870d31c7b4cbee9 David Howells 2026-05-16  26  	rreq->start		= fpos;
870d31c7b4cbee9 David Howells 2026-05-16  27  	rreq->len		= len;
870d31c7b4cbee9 David Howells 2026-05-16  28  	stream->issue_from	= fpos;
870d31c7b4cbee9 David Howells 2026-05-16  29  	stream->buffered	= len;
870d31c7b4cbee9 David Howells 2026-05-16  30  
870d31c7b4cbee9 David Howells 2026-05-16  31  	do {
870d31c7b4cbee9 David Howells 2026-05-16  32  		struct netfs_io_subrequest *subreq;
870d31c7b4cbee9 David Howells 2026-05-16  33  
870d31c7b4cbee9 David Howells 2026-05-16  34  		subreq = netfs_alloc_subrequest(rreq, NETFS_DOWNLOAD_FROM_SERVER);
870d31c7b4cbee9 David Howells 2026-05-16  35  		if (!subreq) {
870d31c7b4cbee9 David Howells 2026-05-16  36  			ret = -ENOMEM;

so ret should probably be false

870d31c7b4cbee9 David Howells 2026-05-16  37  			break;
870d31c7b4cbee9 David Howells 2026-05-16  38  		}
870d31c7b4cbee9 David Howells 2026-05-16  39  
870d31c7b4cbee9 David Howells 2026-05-16  40  		subreq->start	= stream->issue_from;
870d31c7b4cbee9 David Howells 2026-05-16  41  		subreq->len	= stream->buffered;
870d31c7b4cbee9 David Howells 2026-05-16  42  
870d31c7b4cbee9 David Howells 2026-05-16  43  		spin_lock(&rreq->lock);
870d31c7b4cbee9 David Howells 2026-05-16  44  		list_add_tail(&subreq->rreq_link, &stream->subrequests);
870d31c7b4cbee9 David Howells 2026-05-16  45  		trace_netfs_sreq(subreq, netfs_sreq_trace_added);
870d31c7b4cbee9 David Howells 2026-05-16  46  		spin_unlock(&rreq->lock);
870d31c7b4cbee9 David Howells 2026-05-16  47  
870d31c7b4cbee9 David Howells 2026-05-16  48  		netfs_stat(&netfs_n_rh_download);
870d31c7b4cbee9 David Howells 2026-05-16  49  		rreq->netfs_ops->issue_read(subreq);
870d31c7b4cbee9 David Howells 2026-05-16  50  
870d31c7b4cbee9 David Howells 2026-05-16  51  		cond_resched();
870d31c7b4cbee9 David Howells 2026-05-16  52  	} while (stream->buffered > 0);
870d31c7b4cbee9 David Howells 2026-05-16  53  
870d31c7b4cbee9 David Howells 2026-05-16 @54  	return ret;
870d31c7b4cbee9 David Howells 2026-05-16  55  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

