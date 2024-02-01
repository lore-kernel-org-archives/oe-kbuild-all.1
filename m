Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7A515A4B9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Feb 2024 08:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706777314; cv=none; b=Dztb4LhdQHxpi8XUCxN+bwmHOUfOpQtaHGTYtqwrEMWSbO7cejDss44TAqacTwqBXoOFEgdC1i3dk6bysmSreFjCdKhCj3JLurmTqYZUvUgrEqXSh2pCgBOv0/wsrntHeJrelpjKdrSDySm6kR4GV/ykppKLxV6N+GFEhF9yUtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706777314; c=relaxed/simple;
	bh=y3o2aJ7TkFI5uijbm2l3WgkFD3IdAC+L0GGGsjcnqh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=lZFIGdV9i9TEpbcWq0qnStZsENrsqhnnePp6IsW8+mFIxU1Urnr9pIPg/3zhC0jfemsuTlJtj1BpQ7B0fzMfJFYC1QXBmpghs3eVrZod54e6NPB4HkMCmHmjm1tZKU5dLj77hKTmX+mekM3xhsw82YX/VM2rkegIvm0hP1g2mFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JSfU5NoX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JSfU5NoX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706777311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GB8LeYYi9G/0q87kdvcUpfpS5LmGE5Wri5W6FmlAN9k=;
	b=JSfU5NoXpgKgCaMQTczV6pcnid074nEYLVr815YrjKZJm3RrVic80jtxtFJ0h/kDWr+hj0
	V7unVjB0R+Snoy74vdrzSu0Gsj+jiebh/SBhKfY68QpwmrToOK7QG2hMB9H2K7lRCNXMtK
	DIkoB9hzMbz1PTmv5coMGUfxhg8ht5w=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-551-XdD1BYryMTOnIeAGJjG64g-1; Thu,
 01 Feb 2024 03:48:30 -0500
X-MC-Unique: XdD1BYryMTOnIeAGJjG64g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D73883C12CA2;
	Thu,  1 Feb 2024 08:48:29 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.96])
	by smtp.corp.redhat.com (Postfix) with SMTP id CC3351BDB1;
	Thu,  1 Feb 2024 08:48:28 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Thu,  1 Feb 2024 09:47:15 +0100 (CET)
Date: Thu, 1 Feb 2024 09:47:09 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/1] pidfd: implement PIDFD_THREAD flag for
 pidfd_open()
Message-ID: <20240201084709.GA27850@redhat.com>
References: <20240131132602.GA23641@redhat.com>
 <202402011558.BUpYBZyG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202402011558.BUpYBZyG-lkp@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I guess I do not really need to reply, but just in case...

On 02/01, kernel test robot wrote:
>
> >> kernel/fork.c:2201:70: warning: if statement has empty body [-Wempty-body]
>     2201 |         if (!pid || !pid_has_task(pid, thread ? PIDTYPE_PID : PIDTYPE_TGID));
>          |                                                                             ^
>    kernel/fork.c:2201:70: note: put the semicolon on a separate line to silence this warning
>    1 warning generated.

Yes, thank you dear Kernel Test Robot, this was already fixed
by Tycho.

Oleg.

