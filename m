Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E411B14FD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 14:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720103964; cv=none; b=RgrSRrDDkIRzv4xMN5Wt1s0KR2PgBMWL//tWfjthWYu3QcV8O3V82GTKb3VFeSVU/X2USlWLqILaaTfCPkP+JhXQbS9WKKFS2QDrxnLKPqO9YTvmcOb6FrPLW64HTfpcjxvkmMmkjKNpHNkC+SUmLrSN4hOP/m5ZROlYiDep/is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720103964; c=relaxed/simple;
	bh=KqUPrLODUhxCWHE+ObWfrEUBOESaJQDDJqOpp6AAKr0=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:Date:
	 Message-ID:Content-Type; b=hZ9D1N7iiDMziK1DtTZAWKz1FN+dFk14t1vgrupmvdoZuUrv2SlOabWu35sHUaswQgjcNAcAUaLdS+KklKHIbBWYznW8SbN96Nz+3QMbKoPjX2W1Q7LQhaYUsRI33eJCpEaS4FqC4HK1TDd6muQ1UuMDywG+rZlW8gdNU8MFTeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ef7wxN1R; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ef7wxN1R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720103962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uc5IoTpoolxAjfPXWEM4B2yjDn3gCKxw0vnQAhDYV2Q=;
	b=Ef7wxN1Rma+JeQhgBbsq7gsOgMDRtq/wxREnq1aZQvdwe3b3eyu29q9FWYQ031bXpNIa/R
	ND5MF3a8/ktKKFZbeEMn2+wyiI67HpRTQbHNGI2Dwch9H24ufM9GYO7avQo9H7HR2y9Ros
	bF9ptiUam9tWPD5i3J9gFDZYGowSMe8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-398-YXFcCM31MimCD8cVUOW13Q-1; Thu,
 04 Jul 2024 10:39:18 -0400
X-MC-Unique: YXFcCM31MimCD8cVUOW13Q-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ACC5B19560AA;
	Thu,  4 Jul 2024 14:39:17 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.111])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 24F861955F65;
	Thu,  4 Jul 2024 14:39:15 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <6cc43674-4d95-49b6-a279-4b0c7f7f4ceb@suswa.mountain>
References: <6cc43674-4d95-49b6-a279-4b0c7f7f4ceb@suswa.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dhowells@redhat.com, oe-kbuild@lists.linux.dev, lkp@intel.com,
    oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:netfs-writeback 16/17] fs/netfs/read_collect.c:170 netfs_consume_read_data() error: we previously assumed 'folioq' could be null (see line 110)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 04 Jul 2024 15:39:14 +0100
Message-ID: <3303253.1720103954@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3303252.1720103954.1@warthog.procyon.org.uk>

Dan Carpenter <dan.carpenter@linaro.org> wrote:

> 5a2bec0ed38eec David Howells 2024-07-02  102  	if (WARN_ON_ONCE(!folioq) ||
> 
> Presumably we're never going to trigger this warning...

So I hope.  The only ways to get to this point should involve preallocating a
folio_queue struct and attaching it to the queue pointers (see
netfs_prime_buffer() and netfs_create_singular_buffer()) and we don't
deallocate the queue till the cleanup phase.

The other two have triggered occasionally.  Hopefully, I've fixed all of
those.

David

