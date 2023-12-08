Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E998E46B9F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Dec 2023 18:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dw5GH/4e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6EEC433C8;
	Fri,  8 Dec 2023 18:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1702059289;
	bh=587oMB1jPxgCQH3BWOEzyVYroJ0mnskE/47uTfixC2I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dw5GH/4e9br1HzAIgyQHnpBCH8912Odmj6u7dr6QEoS5xzUJoRiZeJm70dMb82Mqm
	 QfZ1uLtcqAiPyWvAefxCH0ufZiEeq66kz9IB8njeSXGrIjunsrnzE6vzhoA3Bs9Kkl
	 O887B1IaQFaogFLhYf0zHgvvV1GYGEHzt3iVRqdU=
Date: Fri, 8 Dec 2023 10:14:43 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 5469/6165] uffd-common.c:636:28: warning:
 unused variable 'uffdio_move'
Message-Id: <20231208101443.e1a153ff6d7d753685af024d@linux-foundation.org>
In-Reply-To: <CAJuCfpE0rvr1apUmrErS-9=QsfTMWt_P-a3xJLNLOfr75AXytg@mail.gmail.com>
References: <202312081716.LUUhSNS4-lkp@intel.com>
	<CAJuCfpF_FN07Pvn5BJn1vJMAeEPKRBdfT3kWXVD=WAfizto+UQ@mail.gmail.com>
	<20231208100519.aa94b349b45e3b7ff25b3eba@linux-foundation.org>
	<CAJuCfpG_aCQpCSJPTg2SxuhfKbRWjPN4SM6BU-FJMr6cARM2eg@mail.gmail.com>
	<CAJuCfpE0rvr1apUmrErS-9=QsfTMWt_P-a3xJLNLOfr75AXytg@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 8 Dec 2023 10:09:31 -0800 Suren Baghdasaryan <surenb@google.com> wrote:

> 
> Hmm. I still see incorrect version in both mm-unstable and in
> linux-next after fetching and rebasing. Maybe I should check a bit
> later?

Pushed out now.
