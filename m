Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92715182B7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Aug 2023 13:08:11 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 333B02800C997;
	Fri, 18 Aug 2023 15:00:19 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 251AC2ED3E8; Fri, 18 Aug 2023 15:00:19 +0200 (CEST)
Date: Fri, 18 Aug 2023 15:00:19 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Dave Jiang <dave.jiang@intel.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [davejiang:cxl-ide 5/24] lib/spdm_requester.c:501: warning:
 Function parameter or member 'leaf_key' not described in 'spdm_state'
Message-ID: <20230818130019.GA28158@wunner.de>
References: <202308181526.l7us0AP7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308181526.l7us0AP7-lkp@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Aug 18, 2023 at 03:16:05PM +0800, kernel test robot wrote:
> >> lib/spdm_requester.c:501: warning: Function parameter or member 'leaf_key' not described in 'spdm_state'

Dave's branch is based on an older version my doe branch which
didn't contain proper kernel-doc for the leaf_key member yet.

I've since added the kernel-doc, so after a rebase this warning
should go away.

Thanks,

Lukas
