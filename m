Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A67B283FF0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 15:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755789016; cv=none; b=pZaqDkqnPoHstIhAHPA17WORubwYoVBScXXMqnvU8rq9MVwEjxTS6cejiJdhqQ7NEewTTdhF8M9xm0cUZPRjaXaYay0mo+daS2MejWxxUXHy6dEOFyhzGxsuPX7GBiidphzjUCEJ4oJYPIH+0XMmW7jwe8zG9cZG3p5w92yEYzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755789016; c=relaxed/simple;
	bh=kkd9p7v/aeoVq2ozdbObxHEzcNi5TW7nCk3fYeZSrxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qcUmLD55Za/f9OHgnqgZJjRsF2DuuF6KhAwm1+K+Ec4E9PcaEnAAKTs6AkOiQv6lsdKVWUfpXR/PTPjogkQL4rerHHFoQIjUrubCo9dQ3/mu4bzXM3QvK210ikEgN3wmdWJG2Dl7m18h/lTVai1BRQBtQmO9cav8Ix5qbZsxWSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cVP4W8dH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cVP4W8dH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755789014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h/oo2Y2o/Eqajzx8Zc19c3hUMPVFk+7ED7j+YW05FKY=;
	b=cVP4W8dHFx+0Epv6ypBWrX0docY51xuuM0R3jdeLhgeDiHGls0cMXZK9Ak9BeAOCP9PlVC
	4iuqK7r3zSh6wYwQZY5aV1i2Y+B6ACofTo0jd0sm2nzkCnStYKh7sS6d6LvGGxhbF6JN/a
	UAge5NsRUxdZsgegAUOT5NaQW1uly4s=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-599-5n-r4xDBP3iJj0eeiCFFHQ-1; Thu,
 21 Aug 2025 11:10:11 -0400
X-MC-Unique: 5n-r4xDBP3iJj0eeiCFFHQ-1
X-Mimecast-MFC-AGG-ID: 5n-r4xDBP3iJj0eeiCFFHQ_1755789010
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 55033180028D;
	Thu, 21 Aug 2025 15:10:09 +0000 (UTC)
Received: from fedora (unknown [10.72.116.34])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5AECB180029C;
	Thu, 21 Aug 2025 15:10:02 +0000 (UTC)
Date: Thu, 21 Aug 2025 23:09:57 +0800
From: Ming Lei <ming.lei@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: Re: [axboe-block:for-6.18/io_uring 16/16]
 include/linux/io_uring/cmd.h:123:1: error: expected identifier or '(' before
 '{' token
Message-ID: <aKc2xVvyo6sPgCOP@fedora>
References: <202508212218.pOwu5QFJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202508212218.pOwu5QFJ-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dhYvcvn3LhPNMmxMfjFbMW_CYhn9NcNAzh1UQg8jSN4_1755789010
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 21, 2025 at 10:46:05PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.18/io_uring
> head:   55dc643dd2ad15e755a706980692a374de1bb7a8
> commit: 55dc643dd2ad15e755a706980692a374de1bb7a8 [16/16] io_uring: uring_cmd: add multishot support
> config: i386-buildonly-randconfig-001-20250821 (https://download.01.org/0day-ci/archive/20250821/202508212218.pOwu5QFJ-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508212218.pOwu5QFJ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508212218.pOwu5QFJ-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>    In file included from block/fops.c:20:
> >> include/linux/io_uring/cmd.h:123:1: error: expected identifier or '(' before '{' token
>      123 | {
>          | ^
> >> include/linux/io_uring/cmd.h:121:1: warning: 'io_uring_cmd_buffer_select' declared 'static' but never defined [-Wunused-function]
>      121 | io_uring_cmd_buffer_select(struct io_uring_cmd *ioucmd, unsigned buf_group,
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~

Hi Jens,

Can you fold the following change into this patch?


diff --git a/include/linux/io_uring/cmd.h b/include/linux/io_uring/cmd.h
index be0e29b72669..4bd3a7339243 100644
--- a/include/linux/io_uring/cmd.h
+++ b/include/linux/io_uring/cmd.h
@@ -119,7 +119,7 @@ static inline void io_uring_cmd_issue_blocking(struct io_uring_cmd *ioucmd)
 }
 static inline struct io_br_sel
 io_uring_cmd_buffer_select(struct io_uring_cmd *ioucmd, unsigned buf_group,
-			   size_t *len, unsigned int issue_flags);
+			   size_t *len, unsigned int issue_flags)
 {
 	return (struct io_br_sel) { .val = -EOPNOTSUPP };
 }


Thanks,
Ming

