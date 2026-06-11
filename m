Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB723BADA7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 08:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168376; cv=none; b=k9F7xu5vRNpLUYxsiSQxvkW3rktEREToWcTPE/9+jHrBhl9JnhMucIzOm3Dg6GA+7023f2MtPyTtFexfhegmSISqSZUZsVXaAut2f0PZuBnojFPoCaiWWVbWAPfCSOxicwI3vsRc3mmoErQRsUJBVXwrYYe558rTJ0C7TU4fFAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168376; c=relaxed/simple;
	bh=RaJv571HKEcRvX9MGjkYaW+4oKH2q5iRRdHFPdhTId0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=BtKZ5PkIf5xSXkbZ6ErJSKcZe1dYDnxHzFuv+YkxTRjxM6cpG7rfB5eYaZLJgmuvDcOngBwVqBE55GSPCXExitpYbEPkAJcfMgkOFhEM2SxqLH1yKHC0bS0f8UiOxhV6alRbRZKpR71yN10DjOqY339pNl2SCBm5v8HtsjpOOro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MkV7WzK0; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkV7WzK0"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-91562bf6c12so929269985a.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 01:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781168374; x=1781773174; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4uXW7MRbQJd427EHnO48VbQxxD2p5RQ9HepN918NJz8=;
        b=MkV7WzK0f7B5+mF78gzjPzi/LJ4XsZVFfnl0SpDIWx/DuGKJUWoHWA7jQxdNL1+ATx
         3QiTt/QYhwGhmSazu6TzGgRF++k9VnBPfVlnP7aUqXa/JZcVhlOuDW3WeL5ZIWbZ772v
         FwqcYf842+F8nyfKyAdeUnNuP2vt8H3jgel6rh0SABtluWrWEXRFKaQueJFsW/AzfQ7A
         edBX/PUwYMZWA1K32l5VaGI6rxaPiEXaEtoEKimRK5m7U4pHLjTsxSlT0YP9vC6EVwD4
         RQzFXy8scG2yVvUEYm2MKqF0qzuS57RoYnHfpsRHuHQbbghNGN6DSvOkAlABl3sqIzzD
         GEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168374; x=1781773174;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4uXW7MRbQJd427EHnO48VbQxxD2p5RQ9HepN918NJz8=;
        b=TQ1oT1rAZW9p4movC9RpmtLP0Qu6dmaQBynX3FvTsFwQ9G3CKYA8WMQLN7iuriIyfA
         /UXP4ax4lH67s9J+YUxVGkt6YTX7JvF9WHF6tATmByeg1vE3lP64dvz9vTWPdgXJ8VJd
         whkNd7j0EVDoqPXLVN/xWAvROwwmhRGxblUlQvaYDdb8YV0t10/Y02PToCuvAXGqD7tP
         CJLkNLEnu9L3fSMPjGtK5czoQ5Z026Q37OExbv9LCspULzPDo46wRvg9uq4QT2GQo1cq
         2CAHFMl6qhFSrBUxAlZ+DsipAUsLmMyF8elXrmmynsM4IU1ptWWHD4RU/Yw8+kMh4yOD
         QUFw==
X-Forwarded-Encrypted: i=1; AFNElJ961suBBDDm4bFsxAJ4QcRcDnyIr+vv4CVGtj25335gi8ZW5TeSkE9FjlHVTFdgd5CFo3TcH7X1Jb/cTHdd@lists.linux.dev
X-Gm-Message-State: AOJu0YwKvv3NrvBOrpPSSIhNsA593laIVzRlXVNuiTJnAjgaPpNeo8FX
	IN1ZYBmQhH2K8RdAhvfPSiAbQVW/mO4Yh9TrbGsDVjL61N5cvqFqDYS0H6fDcm/m5do=
X-Gm-Gg: Acq92OFyW4sxQ1YItiVy7KtIYjsOYJAq4LszL+xf/wTmWrrBRexuuypxNfLRJCtiVw/
	XtZVnKJSKSbz3Nbuuc+ElJp2yxigNT/BRPmVBh9lc2RnBMvNMZmXurKbNy5BLQ2VrvfwXIMwnk6
	TIRMsYcmroiPd2CKdUGKAI0R4zUfAC7zz4Jxcu11/Y4DRqGIDpiZPsvs5ULKRutmnCoTXzpznEe
	1SocsVAZoV632IcQYnajuyK2MzLgtRRo/Aodm80zcEy6ziWO9vk3hF15/4ivILIZE0/4FtCrlI6
	Z/ZJk5+Ifsqc1lbBQEIe1+CQlsXQ6XRrqMbIGJdYkSYg6jRi9cmPzRJCYogBVFCoyiZXZ6bYcw7
	4PhKofz3II4RdzLeDYhFwfqbS53NQjsvqb7G1VLYiLQn97yFbetjiikk+E06a6a2kdT3uRQS1NR
	LQC2Rny2FnBXVYfvLbpzPAPp6LbPE=
X-Received: by 2002:a05:620a:25d0:b0:915:9f28:6741 with SMTP id af79cd13be357-9160ac9657emr268532885a.11.1781168374274;
        Thu, 11 Jun 2026 01:59:34 -0700 (PDT)
Received: from localhost ([149.40.50.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9160ae26238sm127924285a.33.2026.06.11.01.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:59:33 -0700 (PDT)
Date: Thu, 11 Jun 2026 10:18:51 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	virtualization@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Cindy Lu <lulu@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	linux-kernel@vger.kernel.org, Laurent Vivier <lvivier@redhat.com>,
	Yongji Xie <xieyongji@bytedance.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Maxime Coquelin <mcoqueli@redhat.com>
Subject: Re: [PATCH v3] vduse: Add suspend
Message-ID: <202606111115.tKKe1qCE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610083452.477759-1-eperezma@redhat.com>

Hi Eugenio,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugenio-P-rez/vduse-Add-suspend/20260610-164534
base:   next-20260609
patch link:    https://lore.kernel.org/r/20260610083452.477759-1-eperezma%40redhat.com
patch subject: [PATCH v3] vduse: Add suspend
config: arm64-randconfig-r072-20260610 (https://download.01.org/0day-ci/archive/20260611/202606111115.tKKe1qCE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606111115.tKKe1qCE-lkp@intel.com/

smatch warnings:
drivers/vdpa/vdpa_user/vduse_dev.c:577 vduse_vq_kick() warn: inconsistent returns '&vq->kick_lock'.
drivers/vdpa/vdpa_user/vduse_dev.c:1302 vduse_dev_queue_irq_work() warn: inconsistent returns '&dev->rwsem'.

vim +577 drivers/vdpa/vdpa_user/vduse_dev.c

c8a6153b6c59d9 Xie Yongji        2021-08-31  562  static void vduse_vq_kick(struct vduse_virtqueue *vq)
c8a6153b6c59d9 Xie Yongji        2021-08-31  563  {
c8a6153b6c59d9 Xie Yongji        2021-08-31  564  	spin_lock(&vq->kick_lock);
                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^
c8a6153b6c59d9 Xie Yongji        2021-08-31  565  	if (!vq->ready)
c8a6153b6c59d9 Xie Yongji        2021-08-31  566  		goto unlock;
c8a6153b6c59d9 Xie Yongji        2021-08-31  567  
9c4307e82fa1dc Eugenio Pérez     2026-06-10  568  	guard(rwsem_read)(&vq->dev->rwsem);
9c4307e82fa1dc Eugenio Pérez     2026-06-10  569  	if (vq->dev->suspended)
9c4307e82fa1dc Eugenio Pérez     2026-06-10  570  		return;

unlock before returning?

9c4307e82fa1dc Eugenio Pérez     2026-06-10  571  
c8a6153b6c59d9 Xie Yongji        2021-08-31  572  	if (vq->kickfd)
3652117f854819 Christian Brauner 2023-11-22  573  		eventfd_signal(vq->kickfd);
c8a6153b6c59d9 Xie Yongji        2021-08-31  574  	else
c8a6153b6c59d9 Xie Yongji        2021-08-31  575  		vq->kicked = true;
c8a6153b6c59d9 Xie Yongji        2021-08-31  576  unlock:
c8a6153b6c59d9 Xie Yongji        2021-08-31 @577  	spin_unlock(&vq->kick_lock);
c8a6153b6c59d9 Xie Yongji        2021-08-31  578  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

