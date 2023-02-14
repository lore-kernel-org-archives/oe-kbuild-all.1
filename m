Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE3923D5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 04:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676348096; x=1707884096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JIYaxsBhdI8QugIG5FC9uDgYK0wM+u7EP5fcD6bIgLA=;
  b=jU4bE6qMLU6B9omXT+k1+VK3Y7++tSLeRj2YHLhev7gUk6ibETpY5jGi
   7lwBswOOx6qHOXayO3fgLK29fQFnPFeJ5f7e5FaHJLWjRQbgpNrVJUP8q
   RR5nmhbsj/c+I3x7DOgYbGzb3chX8ryWueDSEZtF6sIyspUT8NYTCkwoQ
   QQTDThZ4FTaVFb9lNEB+fX43SXWimAT8jL1ov0J969QT7n//uhJJV7N5s
   bmXu640/pYWsiwfwFUCMSfDBBhOcgO+ZH5RAT21uehXKUktvVt6/aslgy
   Rrux/q8bvw/W7Mtmqt7wHg1UQCqh37+qYh4haZ5lQLY7VAgGmKferGPNU
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="329701799"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="329701799"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 20:14:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="914592844"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="914592844"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Feb 2023 20:14:54 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRmiT-0008CX-1z;
	Tue, 14 Feb 2023 04:14:53 +0000
Date: Tue, 14 Feb 2023 12:14:19 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
	linux-doc@vger.kernel.org
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 17/107] htmldocs: Warning:
 Documentation/devicetree/bindings/power/wakeup-source.txt references a file
 that doesn't exist:
 Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
Message-ID: <202302141230.nVFyJ8OO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   3eb1c8811f15264354cd69b7e98ff292aa259ec5
commit: 9f8f871682750e1539e68435dae4df7e220ff9c3 [17/107] dt-bindings: input: qcom,pm8921-keypad: convert to YAML format
reproduce:
        # https://github.com/krzk/linux/commit/9f8f871682750e1539e68435dae4df7e220ff9c3
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
        git checkout 9f8f871682750e1539e68435dae4df7e220ff9c3
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302141230.nVFyJ8OO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
