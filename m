Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E16F2F7ADF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 10:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763978406; cv=none; b=dLC8zN0+W7StdfinWYtKgh/QRDuX9Zy7cN7nTPwPjF4/aNGq2fKGllfRnMmh30n1j8OJc08GaCCUb7244mP1Pd+JREhNXaax3RL4iutRBxd/BUrOABgjZ1bzqcGWr+TlxB4GWx0/kWu3M8C4n8cn2bR41l1Tnmwdwed4Wl+5X24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763978406; c=relaxed/simple;
	bh=OhWCPGewPKbUWM/OVfpZhK5cG26GES8QSTtASqnjwFA=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:Date:
	 Message-ID:Content-Type; b=vGoFe8imuyRF5SwSNEmFh+ADuu1WataXwUUPL131nNYBgnRrjAHj278oodBjYQer8Wodgi1obRmJ3tNhUm7ypUTJV+t7SN5oUrR43Wq/3+KOoIG//WRmp2MJC8ZMqVoxPssr3LS/Ct423/6hknrwee8cU2qg+1ImktBgAGvY/fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b7rw5cH4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b7rw5cH4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763978403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OhWCPGewPKbUWM/OVfpZhK5cG26GES8QSTtASqnjwFA=;
	b=b7rw5cH4uYx34s7GSJyYUdDHxVJuaQ9UJmgibrMZC3f8vw33d0i0SlT/Ytyi6fjyfkQNpT
	lxRvNAtj20xZNss/c0I+S+Db5POKNMN6bqD6pqjhvlfeiPyezLtulhub8FO7lD+DrtjKVt
	O4/YOVsrSeG+kWvBjXNs8Zut2oxQQ8o=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-358-nsjJbw0aNXiJXZNZrhF-2Q-1; Mon,
 24 Nov 2025 05:00:02 -0500
X-MC-Unique: nsjJbw0aNXiJXZNZrhF-2Q-1
X-Mimecast-MFC-AGG-ID: nsjJbw0aNXiJXZNZrhF-2Q_1763978401
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 09FA41800451;
	Mon, 24 Nov 2025 10:00:01 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.14])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 01CE93003761;
	Mon, 24 Nov 2025 09:59:59 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <202511211850.JllIAy7x-lkp@intel.com>
References: <202511211850.JllIAy7x-lkp@intel.com>
To: kernel test robot <lkp@intel.com>
Cc: dhowells@redhat.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:keys-pqc 5/8] make[4]: *** No rule to make target 'crypto/mldsa.o', needed by 'crypto/'.
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 24 Nov 2025 09:59:58 +0000
Message-ID: <3377502.1763978398@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GOmLWag2nzBgt3rvQL6KYXfv_b85C9qd3REmVV9zWJA_1763978401
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3377501.1763978398.1@warthog.procyon.org.uk>

I forgot to git add the file to the patch.

David

