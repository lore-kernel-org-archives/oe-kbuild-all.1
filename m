Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACEB179B4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 19:31:17 +0000 (UTC)
Received: from imladris.home.surriel.com ([10.0.13.28] helo=imladris.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <riel@shelob.surriel.com>)
	id 1qkrA5-0005Zv-2J;
	Mon, 25 Sep 2023 15:22:29 -0400
Message-ID: <692fafae9842a9b15b7b4a033bb7dc800784d4aa.camel@surriel.com>
Subject: Re: [PATCH 3/3] hugetlbfs: replace hugetlb_vma_lock with
 invalidate_lock
From: Rik van Riel <riel@surriel.com>
To: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, kernel-team@meta.com, linux-mm@kvack.org,
  akpm@linux-foundation.org, muchun.song@linux.dev, mike.kravetz@oracle.com,
  leit@meta.com, willy@infradead.org
Date: Mon, 25 Sep 2023 15:22:29 -0400
In-Reply-To: <202309250923.NEPT0ip2-lkp@intel.com>
References: <20230922190552.3963067-4-riel@surriel.com>
	 <202309250923.NEPT0ip2-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Sender: riel@surriel.com

On Mon, 2023-09-25 at 10:04 +0800, kernel test robot wrote:
> Hi,
>=20
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on akpm-mm/mm-everything]
> [also build test ERROR on linus/master v6.6-rc3 next-20230921]
> [If your patch is applied to the wrong git tree, kindly drop us a
> note.
> And when submitting patch, we suggest to use '--base' as documented
> in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]

OK, so I have a fix for patch 3/3 that gets rid of the
compile error, but the libhugetlbfs test cases show that
patch 3/3 opens up a condition where resv_hugepages=20
underflows.

I have not figured out the cause of that yet, but
patches 1 & 2 seem to survive all tests fine.

--=20
All Rights Reversed.
