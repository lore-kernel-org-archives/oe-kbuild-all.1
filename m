Received: from muru.com (muru.com [72.249.23.125])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D525640
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jan 2023 06:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 0D3B080A6;
	Fri, 13 Jan 2023 06:06:03 +0000 (UTC)
Date: Fri, 13 Jan 2023 08:06:01 +0200
From: Tony Lindgren <tony@atomide.com>
To: kernel test robot <lkp@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: Update pinctrl-single to use yaml
Message-ID: <Y8D0ycL38T6kRkl5@atomide.com>
References: <20230112083152.10277-1-tony@atomide.com>
 <202301130430.KmUFHrrZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301130430.KmUFHrrZ-lkp@intel.com>

* kernel test robot <lkp@intel.com> [230112 20:19]:
> All warnings (new ones prefixed by >>):
> 
> >> Warning: Documentation/devicetree/bindings/arm/omap/ctrl.txt references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
> >> Warning: Documentation/devicetree/bindings/pinctrl/ti,omap-pinctrl.txt references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt

Thanks for the report, I'll update the patch to change the omap/ctrl.txt to
reference the new pinctlr-single.yaml file. And we can now just remove the old
pinctrl/ti,omap-pinctrl.txt.

Regards,

Tony
