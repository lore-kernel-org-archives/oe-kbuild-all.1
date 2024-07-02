Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DE51BC084
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 15:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719934182; cv=none; b=XrhabVkMdaZcmA4SgyGosQw8/NaxSoHISJaRzN7j97KcsNUzWnh9VT6lv1FL9n/qJ7E+6NwLNFo7hlgOUMMhcPSvtjHa+ShLZFK6w8gJvABuQAwH7vhyeuHkpt+iwhTSNBYZ0DFGk7fL9t2I6BhBS4u4xxB6lChL6EmCRnxYQt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719934182; c=relaxed/simple;
	bh=alXjmjvoxxRDcpYx3oTWlDx4m+xR74wMo9hWajn0SyQ=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:Date:
	 Message-ID:Content-Type; b=i8/d2RfltVhra6olzMYdAtAU7IPseHxWacbAOo0z2MgCnS8LPV9D+VDA8Hgg6fTnnlqK00INEJIM1mMc8pk609LrROvNpIaiQWwlEXGPX+FPZmLfJn4XrzoK2v3z8QqlrJ5TbjcGrOXnitZiGwgHDd8ykUogZCCnZ0i/2TmB8N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g5xDVUXt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g5xDVUXt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719934180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wkOOuZX/hOIqszPR6UUhbSim5YKWErDeB1hX/yvppLo=;
	b=g5xDVUXt9GFO/5xVQxbcQbsBGafqssZxOPcOTXyF8azD5bF4PbqOsmiAnsS++eYVru+4nh
	ZMZabGRjEpD3/4SnmT8eQZuN52P3TClIu0deQvreTI5AYQYJOsW7HKknfRS7fZtyGK4vL7
	7k5EtejlW0EYKYzN2agcxnTWeLPd9ow=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-655-vSjMq4fuNXG817pKsSOKlQ-1; Tue,
 02 Jul 2024 11:29:38 -0400
X-MC-Unique: vSjMq4fuNXG817pKsSOKlQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9F3A51933181;
	Tue,  2 Jul 2024 15:29:37 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.111])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BB07919560A3;
	Tue,  2 Jul 2024 15:29:36 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <202407021929.qZyrumT3-lkp@intel.com>
References: <202407021929.qZyrumT3-lkp@intel.com>
To: kernel test robot <lkp@intel.com>
Cc: dhowells@redhat.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:netfs-writeback 16/17] fs/smb/client/file.c:259:13: warning: 'cifs_expand_readahead' defined but not used
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 02 Jul 2024 16:29:35 +0100
Message-ID: <3044018.1719934175@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3044017.1719934175.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable

kernel test robot <lkp@intel.com> wrote:

> >> fs/smb/client/file.c:259:13: warning: 'cifs_expand_readahead' defined =
but not used [-Wunused-function]
>      259 | static void cifs_expand_readahead(struct netfs_io_request *rre=
q)
>          |             ^~~~~~~~~~~~~~~~~~~~~

I've posted a patch to remove this function as it causes a regression in re=
ad
performance.

David

