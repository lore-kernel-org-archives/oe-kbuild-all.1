Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDEE1362
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Mar 2025 00:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742776628; cv=none; b=hRPKctWUfRAO4ZAHVIqDhYkDBgvFC7+r6EOU/lDaN022TIgTE1M1Dv1RLc4WUnjjI/90820C8ZdupGiZqynj6lZls+QMfs1+RvSm77LQbtL/2KoiB10Eaki/qE9OsJFs9SIKqWXgnOMbljfwoDInUBHfAYvtcLtaB1a//YOLROo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742776628; c=relaxed/simple;
	bh=rQWpWKfJu1ODVLD9nlJ391rHu2s5JbRiWmeEwVY+kJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ub0SpAYez6QvqRHo/b1afLrKpIyicZBCjzcyrHvxgwQr77TSSre6JwjUa90rZUbvhHsqZ9WRZDTWYop606NZILjDHu/ZYJdtThcuy4JpbnxrWUxkuowVzGxKaeHAfyX0wVeZbf2Dvyq/C1L/bWU/wLrpFZ/X2982Ek8f8VO2QmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MnvwSc8i; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MnvwSc8i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742776625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A/CfFmC8ohMJkpgg49JZmyv+g3r4W+cPWVs2W2Icihg=;
	b=MnvwSc8iroc4awvNxMBLTcjolfCHwkPur9z0VFoztrnU3IDkLhzxNK9tPn8zyIdhio4Y3i
	cwUstSnvWZsXSu5cgsZ+DanZ3rboBP+MPS9AxlMyzENKAwmDWWIxO+KSIrjgA73OudANm9
	YUJE6P5q3ISsKqQT+Ea1nyGpImC1q98=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-108-xKdUcyJ3NGyVB_SL46ILqQ-1; Sun,
 23 Mar 2025 20:36:32 -0400
X-MC-Unique: xKdUcyJ3NGyVB_SL46ILqQ-1
X-Mimecast-MFC-AGG-ID: xKdUcyJ3NGyVB_SL46ILqQ_1742776591
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 96CE3180034D;
	Mon, 24 Mar 2025 00:36:30 +0000 (UTC)
Received: from fedora (unknown [10.72.120.9])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2E136180A801;
	Mon, 24 Mar 2025 00:36:25 +0000 (UTC)
Date: Mon, 24 Mar 2025 08:36:19 +0800
From: Ming Lei <ming.lei@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: Re: [axboe-block:for-6.15/block 75/76]
 drivers/block/loop.c:388:6-25: WARNING: atomic_dec_and_test variation before
 object free at line 395.
Message-ID: <Z-CpA6YVKLc2zxfb@fedora>
References: <202503240625.LfSMQqA2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202503240625.LfSMQqA2-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VxLpfayMqEz-fDo6CPvo_Ohmswbvs8tDgxYXTASjas4_1742776591
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 24, 2025 at 06:52:22AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.15/block
> head:   4c3f4bad7a6e9022489a9f8392f7147ed3ce74b1
> commit: dfc77a934a3acdb13dadf237b7417c6a31b19da8 [75/76] loop: try to handle loop aio command via NOWAIT IO first
> config: i386-randconfig-052-20250323 (https://download.01.org/0day-ci/archive/20250324/202503240625.LfSMQqA2-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503240625.LfSMQqA2-lkp@intel.com/
> 
> cocci warnings: (new ones prefixed by >>)
> >> drivers/block/loop.c:388:6-25: WARNING: atomic_dec_and_test variation before object free at line 395.

The code itself is safe. Event through the atomic counter drops to zero,
the object isn't freed, and the counter can be re-initialized & requeued
internally.

This cocci rule should be 'wrong', or anyone can explain the exact risk
here?


Thanks,
Ming

