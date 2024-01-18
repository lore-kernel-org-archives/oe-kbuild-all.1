Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CDE25756
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 13:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705585088; cv=none; b=E4KT/V831XAc0nKjZ0CvIkgW35ElfYpdGKodMSjkeKDYsOgb3S8S6J77C7ijeWD8FA0vmsa77Qrj+PgYvSnjlWo9Lu7Em8SIMcN2XD8Bs+ZSn24n50Ub76mWn3FWmpvI7cqHTQJyao7Lhi/4E1dZI8Z4mFN9T9+u+WpGxNn4TAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705585088; c=relaxed/simple;
	bh=jJ9hTQk49qoRevTOs9B8+VukAO3S/cndz0fR/JP0jNU=;
	h=DKIM-Signature:Received:X-MC-Unique:Received:Received:
	 Organization:From:In-Reply-To:References:To:Cc:Subject:
	 MIME-Version:Date:Message-ID:X-Scanned-By:X-Mimecast-Spam-Score:
	 X-Mimecast-Originator:Content-Type:Content-ID; b=TIiTI657c9dWSxOVnqGb+nUtMNMpiBcjjkk73Bzuk1cnoNUUhC45kwR8j3QngriGHReyQ3msnxU2L3hYvsFoDYAG3k3HpqMFyqvlVMFwbCv+ml9VGEIAwNW4Mpty3J6U4VXWxsTkBOvIn1UnxdXHmk0s+q/1fZ5uMQcVigT6JAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E0YJ/7Cx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E0YJ/7Cx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705585085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2HlLh2mrJyic6tRSe0wGXtmNnowiGMNXeCWjlTcvPo0=;
	b=E0YJ/7Cx+1C7ZwMNNEQorK+LD90TBl+XiEq5Wfa9mMN89snY/+KOxqwxRZ4/1Au/cK04//
	EQT9sB2pNsx42Gwges8KU4C3SIrEPjj+LRpwHfy4+gJMvz6Aa4F3VQNuDLSxwKQrqwRrfy
	ZXSSeIDZi7QTAUb9Htnd/0vCkaH/ULM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-533-u16DNc2WP1-6qX9YXK6-mQ-1; Thu,
 18 Jan 2024 08:38:02 -0500
X-MC-Unique: u16DNc2WP1-6qX9YXK6-mQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25527383CD7D;
	Thu, 18 Jan 2024 13:38:02 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ABC76C03282;
	Thu, 18 Jan 2024 13:38:01 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <202401020602.niNMXwmD-lkp@intel.com>
References: <202401020602.niNMXwmD-lkp@intel.com>
To: kernel test robot <lkp@intel.com>
Cc: dhowells@redhat.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:crypto-krb5 20/21] net/rxrpc/txbuf.c:90:41: sparse: sparse: incorrect type in assignment (different base types)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 18 Jan 2024 13:38:01 +0000
Message-ID: <3085867.1705585081@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3085866.1705585081.1@warthog.procyon.org.uk>

kernel test robot <lkp@intel.com> wrote:

>   > 90			txb->wire.serviceId	= csp->hdr.serviceId;

Yeah - missing htons().  Will fold it in.

David

